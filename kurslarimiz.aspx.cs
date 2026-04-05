using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace karasustilyuzmecom
{
    public partial class kurslarimiz : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        void LoadCourses()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT
                        KursID,
                        KursTitle,
                        ShortDescription,
                        KursTitleImage,
                        Kategori
                    FROM Kurslar
                    WHERE IsActive = 1
                    ORDER BY CreateDate DESC
                ", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // UI için ekstra kolonlar
                dt.Columns.Add("ImageUrl");
                dt.Columns.Add("DetailUrl");
                dt.Columns.Add("CssClass");

                foreach (DataRow row in dt.Rows)
                {
                    row["ImageUrl"] = row["KursTitleImage"].ToString();
                    row["DetailUrl"] = "kurslarimiz-detay.aspx?kursID=" + row["KursID"];
                    row["CssClass"] = ToCssClass(row["Kategori"].ToString());
                }

                rptCourses.DataSource = dt;
                rptCourses.DataBind();
            }
        }

        string ToCssClass(string kategori)
        {
            if (string.IsNullOrEmpty(kategori))
                return "";

            return kategori
                .ToLower()
                .Replace(" ", "-")
                .Replace("ç", "c")
                .Replace("ş", "s")
                .Replace("ğ", "g")
                .Replace("ü", "u")
                .Replace("ö", "o")
                .Replace("ı", "i");
        }
    }
}
