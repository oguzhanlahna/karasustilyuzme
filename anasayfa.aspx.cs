using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace karasustilyuzmecom
{
    public partial class anasayfa : System.Web.UI.Page
    {

        private readonly string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetHomePopularBlogs();
                //LoadFeaturedCourses();
            }
        }

        private void GetHomePopularBlogs()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                const string query = @"
                    SELECT TOP 3
                        BlogID,
                        Title,
                        Content,
                        FeaturedImage,
                        PublishDate
                    FROM BlogPosts
                    ORDER BY PublishDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptHomePopularBlogs.DataSource = dt;
                rptHomePopularBlogs.DataBind();
            }
        }
    }
}