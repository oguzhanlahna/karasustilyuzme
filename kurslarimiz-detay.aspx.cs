using System;
using System.Data.SqlClient;
using System.Configuration;

namespace karasustilyuzmecom
{
    public partial class kurslarimiz_detay : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int kursID;
                if (!int.TryParse(Request.QueryString["kursID"], out kursID))
                {
                    Response.Redirect("kurslarimiz.aspx");
                    return;
                }

                LoadCourse(kursID);
                LoadOtherCourses(kursID);
            }
        }

        void LoadCourse(int kursID)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT * FROM Kurslar
                    WHERE KursID = @KursID AND IsActive = 1", con);
                cmd.Parameters.AddWithValue("@KursID", kursID);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    ltTitle.Text = dr["KursTitle"].ToString();
                    ltBreadTitle.Text = dr["KursTitle"].ToString();
                    ltDetailTitle.Text = dr["KursTitle"].ToString();

                    ltDate.Text = Convert.ToDateTime(dr["CreateDate"]).ToString("dd MMMM yyyy");
                    ltKategori.Text = dr["Kategori"].ToString();

                    ltEgitmen.Text = dr["EgitmenName"].ToString();
                    ltEgitmenSidebar.Text = dr["EgitmenName"].ToString();
                    ltEgitmenDesc.Text = dr["EgitmenDesc"].ToString();

                    ltDescription.Text = "<p>" + dr["Description"] + "</p>";
                    ltChallenges.Text = "<p>" + dr["Challenges"] + "</p>";
                    ltSolutions.Text = "<p>" + dr["Solutions"] + "</p>";
                    ltResults.Text = "<p>" + dr["Results"] + "</p>";

                    imgKurs.ImageUrl = dr["KursImage"].ToString();
                    imgEgitmen.ImageUrl = dr["EgitmenImage"].ToString();
                }
                else
                {
                    Response.Redirect("kurslarimiz.aspx");
                }
            }
        }

        void LoadOtherCourses(int currentKursID)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT TOP 5 KursID, KursTitle
                    FROM Kurslar 
                    WHERE KursID <> @KursID AND IsActive = 1
                    ORDER BY CreateDate DESC", con);

                cmd.Parameters.AddWithValue("@KursID", currentKursID);
                con.Open();

                rptOtherCourses.DataSource = cmd.ExecuteReader();
                rptOtherCourses.DataBind();
            }
        }
    }
}
