using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace karasustilyuzmecom
{
    public partial class SiteMaster : MasterPage
    {
        private const string DB_CONN_NAME = "MyConnectionString";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect sonrası popup göster
            if (!IsPostBack && Session["KSY_POPUP_OK"] != null)
            {
                bool ok = (bool)Session["KSY_POPUP_OK"];
                string msg = Session["KSY_POPUP_MSG"] as string;

                Session.Remove("KSY_POPUP_OK");
                Session.Remove("KSY_POPUP_MSG");

                Popup(ok, msg, true);
            }
        }

        // =========================
        // HELPERS
        // =========================
        private static bool IsValidEmail(string s)
        {
            if (string.IsNullOrWhiteSpace(s)) return false;
            return Regex.IsMatch(s, @"^[^@\s]+@[^@\s]+\.[^@\s]+$", RegexOptions.IgnoreCase);
        }

        private void Popup(bool ok, string message, bool refreshOnClose)
        {
            var safe = HttpUtility.JavaScriptStringEncode(message ?? "");

            var js =
                "if(window.KSY && typeof KSY.open==='function'){" +
                "KSY.open('" + safe + "', " +
                (ok ? "true" : "false") + ", " +
                (refreshOnClose ? "true" : "false") +
                ");}";

            Page.ClientScript.RegisterStartupScript(
                this.GetType(),
                "ksy_popup_" + Guid.NewGuid().ToString("N"),
                js,
                true
            );
        }

        private static string GetDbConnectionString()
        {
            var csObj = ConfigurationManager.ConnectionStrings[DB_CONN_NAME];
            if (csObj == null || string.IsNullOrWhiteSpace(csObj.ConnectionString))
                throw new Exception("Veritabanı bağlantısı tanımlı değil.");
            return csObj.ConnectionString;
        }

        private static string GetClientIp(HttpRequest req)
        {
            string ip = req.Headers["CF-Connecting-IP"] ??
                        req.Headers["X-Forwarded-For"] ??
                        req.UserHostAddress ??
                        "0.0.0.0";

            if (ip.Contains(",")) ip = ip.Split(',')[0].Trim();
            if (ip.Length > 45) ip = ip.Substring(0, 45);
            return ip;
        }

        // =========================
        // SMTP
        // =========================
        private void SendMail(string to, string subject, string body)
        {
            string host = ConfigurationManager.AppSettings["CONTACT_SMTP_HOST"];
            string portStr = ConfigurationManager.AppSettings["CONTACT_SMTP_PORT"];
            string user = ConfigurationManager.AppSettings["CONTACT_SMTP_USER"];
            string pass = ConfigurationManager.AppSettings["CONTACT_SMTP_PASSWORD"];
            string from = ConfigurationManager.AppSettings["CONTACT_MAIL_FROM"];

            int port = 587;
            int.TryParse(portStr, out port);

            using (var msg = new MailMessage(from, to, subject, body))
            using (var smtp = new SmtpClient(host, port))
            {
                msg.BodyEncoding = Encoding.UTF8;
                msg.SubjectEncoding = Encoding.UTF8;
                msg.IsBodyHtml = false;

                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(user, pass);
                smtp.EnableSsl = true;
                smtp.Send(msg);
            }
        }

        // =========================
        // CONTACT FORM
        // =========================
        protected void btnMasterSubmit_Click(object sender, EventArgs e)
        {
            string name = txtMasterName.Text.Trim();
            string phone = txtMasterPhone.Text.Trim();
            string email = txtMasterEmail.Text.Trim();
            string course = ddlMasterCourse.SelectedValue;

            if (string.IsNullOrWhiteSpace(name) ||
                string.IsNullOrWhiteSpace(phone) ||
                string.IsNullOrWhiteSpace(course))
            {
                Popup(false, "Lütfen zorunlu alanları doldurun.", false);
                return;
            }

            if (!string.IsNullOrWhiteSpace(email) && !IsValidEmail(email))
            {
                Popup(false, "Geçerli bir e-posta giriniz.", false);
                return;
            }

            string to = ConfigurationManager.AppSettings["CONTACT_MAIL_TO"];
            if (string.IsNullOrWhiteSpace(to))
            {
                Popup(false, "Mail alıcı adresi tanımlı değil.", false);
                return;
            }

            string subject = "[Karasu Stil Yüzme] Yeni Bilgi Talebi";

            string body = new StringBuilder()
                .AppendLine("Yeni bilgi talebi:")
                .AppendLine("----------------------")
                .AppendLine("Ad Soyad: " + name)
                .AppendLine("Telefon: " + phone)
                .AppendLine("E-posta: " + (string.IsNullOrWhiteSpace(email) ? "-" : email))
                .AppendLine("Kurs: " + course)
                .ToString();

            try
            {
                SendMail(to, subject, body);

                txtMasterName.Text = "";
                txtMasterPhone.Text = "";
                txtMasterEmail.Text = "";
                ddlMasterCourse.SelectedIndex = 0;

                Session["KSY_POPUP_OK"] = true;
                Session["KSY_POPUP_MSG"] = "Talebiniz alındı. En kısa sürede sizi arayacağız.";

                Response.Redirect(Request.RawUrl, true);
            }
            catch (Exception ex)
            {
                Popup(false, "Mail gönderilemedi: " + ex.Message, false);
            }
        }

        // =========================
        // NEWSLETTER
        // =========================
        protected void btnNewsletterSubmit_Click(object sender, EventArgs e)
        {
            string email = txtNewsletterEmail.Text.Trim();

            if (!IsValidEmail(email))
            {
                Popup(false, "Geçerli bir e-posta giriniz.", false);
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(GetDbConnectionString()))
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = @"
INSERT INTO dbo.NewsletterSubscriptions
(Email, CreatedAtUtc, IpAddress)
VALUES (@Email, SYSUTCDATETIME(), @Ip)";

                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 256).Value = email;
                    cmd.Parameters.Add("@Ip", SqlDbType.VarChar, 45)
                        .Value = GetClientIp(HttpContext.Current.Request);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // Hoşgeldin maili
                string subject = "Karasu Stil Yüzme Akademisi | Hoş Geldiniz";
                string body = "Bültenimize başarıyla kaydoldunuz.\n\nKarasu Stil Yüzme Akademisi";

                SendMail(email, subject, body);

                txtNewsletterEmail.Text = "";

                Session["KSY_POPUP_OK"] = true;
                Session["KSY_POPUP_MSG"] = "Kaydınız alındı. Sistemimize hoş geldiniz!";

                Response.Redirect(Request.RawUrl, true);
            }
            catch (SqlException sx)
            {
                if (sx.Number == 2627 || sx.Number == 2601)
                {
                    Session["KSY_POPUP_OK"] = true;
                    Session["KSY_POPUP_MSG"] = "Bu e-posta zaten kayıtlı.";
                    Response.Redirect(Request.RawUrl, true);
                    return;
                }

                Popup(false, "Veritabanı hatası: " + sx.Message, false);
            }
            catch (Exception ex)
            {
                Popup(false, "Kayıt başarısız: " + ex.Message, false);
            }
        }
    }
}