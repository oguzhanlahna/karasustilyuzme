using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;

namespace karasustilyuzmecom
{
    public partial class bize_ulasin : System.Web.UI.Page
    {
        private static bool IsValidEmail(string s)
        {
            if (string.IsNullOrWhiteSpace(s)) return false;
            return Regex.IsMatch(s, @"^[^@\s]+@[^@\s]+\.[^@\s]+$", RegexOptions.IgnoreCase);
        }

        private void Show(bool ok, string text)
        {
            var css = ok ? "color:#18b26b;" : "color:#ff4d4f;";
            litFormMessage.Text =
                "<p class='disc' style='" + css + " margin:12px 0 0 0;'>" +
                Server.HtmlEncode(text) +
                "</p>";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                btnSend.Text = "Send Message";
        }

        // ✅ Hata bunu bulamadığı için veriyor — burada kesin var
        protected void btnSend_Click(object sender, EventArgs e)
        {
            var trace = Guid.NewGuid().ToString("N").Substring(0, 10);

            var name = (txtName.Text ?? "").Trim();
            var email = (txtEmail.Text ?? "").Trim();
            var phone = (txtPhone.Text ?? "").Trim();
            var subjectUser = (txtSubject.Text ?? "").Trim();
            var message = (txtMessage.Text ?? "").Trim();

            if (string.IsNullOrWhiteSpace(name) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(message))
            {
                Show(false, "Lütfen Ad Soyad, E-posta ve Mesaj alanlarını doldurun.");
                return;
            }

            if (!IsValidEmail(email))
            {
                Show(false, "Lütfen geçerli bir e-posta adresi girin.");
                return;
            }

            var host = (ConfigurationManager.AppSettings["CONTACT_SMTP_HOST"] ?? "").Trim();
            var portStr = (ConfigurationManager.AppSettings["CONTACT_SMTP_PORT"] ?? "587").Trim();
            var user = (ConfigurationManager.AppSettings["CONTACT_SMTP_USER"] ?? "").Trim();
            var pass = (ConfigurationManager.AppSettings["CONTACT_SMTP_PASSWORD"] ?? "").Trim();
            var to = (ConfigurationManager.AppSettings["CONTACT_MAIL_TO"] ?? "").Trim();
            var from = (ConfigurationManager.AppSettings["CONTACT_MAIL_FROM"] ?? "").Trim();

            var ssl = string.Equals(
                (ConfigurationManager.AppSettings["CONTACT_SMTP_ENABLESSL"] ?? "false").Trim(),
                "true",
                StringComparison.OrdinalIgnoreCase
            );

            int port;
            if (!int.TryParse(portStr, out port)) port = 587;

            if (string.IsNullOrWhiteSpace(host) ||
                string.IsNullOrWhiteSpace(user) ||
                string.IsNullOrWhiteSpace(pass) ||
                string.IsNullOrWhiteSpace(to) ||
                string.IsNullOrWhiteSpace(from))
            {
                Show(false, "Mail sistemi yapılandırılmamış görünüyor. (Trace: " + trace + ")");
                return;
            }

            var subject = "[Karasu Stil Yüzme] İletişim Formu - " + name + " - " + trace;
            if (!string.IsNullOrWhiteSpace(subjectUser))
                subject += " | " + subjectUser;

            var body = new StringBuilder()
                .AppendLine("Yeni iletişim formu başvurusu")
                .AppendLine("--------------------------------------------------")
                .AppendLine("Trace: " + trace)
                .AppendLine("Time (UTC): " + DateTime.UtcNow.ToString("u"))
                .AppendLine("Ad Soyad: " + name)
                .AppendLine("E-posta: " + email)
                .AppendLine("Telefon: " + phone)
                .AppendLine("Konu: " + subjectUser)
                .AppendLine()
                .AppendLine("Mesaj:")
                .AppendLine(message)
                .ToString();

            try
            {
                using (var msg = new MailMessage(from, to, subject, body))
                using (var smtp = new SmtpClient(host, port))
                {
                    msg.BodyEncoding = Encoding.UTF8;
                    msg.SubjectEncoding = Encoding.UTF8;
                    msg.IsBodyHtml = false;

                    // Reply-To
                    msg.ReplyToList.Clear();
                    msg.ReplyToList.Add(new MailAddress(email, name));

                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(user, pass);
                    smtp.EnableSsl = ssl;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                    smtp.Send(msg);
                }

                txtName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";

                Show(true, "Teşekkürler! Mesajınız başarıyla gönderildi. (Trace: " + trace + ")");
            }
            catch (Exception ex)
            {
                Show(false, "HATA (Trace: " + trace + "): " + ex.Message);
            }
        }
    }
}