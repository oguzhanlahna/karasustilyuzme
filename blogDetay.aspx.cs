using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace karasustilyuzmecom
{
    public partial class blogDetay : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int blogID = 0;
                if (Request.QueryString["blogID"] != null)
                    int.TryParse(Request.QueryString["blogID"], out blogID);

                if (blogID > 0)
                {
                    LoadBlogPost(blogID);
                    LoadCategories();
                    LoadTags();
                    LoadRelatedPosts(blogID);
                    GetPopularPosts();
                }
            }
        }

        void GetPopularPosts()
        {

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT TOP 3 
                        BlogID, 
                        Title, 
                        PublishDate
                    FROM BlogPosts
                    ORDER BY PublishDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                rptPopularPosts.DataSource = dt;
                rptPopularPosts.DataBind();
            }
        }


        private void LoadBlogPost(int blogID)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM BlogPosts WHERE BlogID=@BlogID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@BlogID", blogID);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    litBlogTitle.Text = dr["Title"].ToString();
                    litContent.Text = dr["Content"].ToString();
                    lblAuthor.Text = dr["Author"].ToString();
                    lblPublishDate.Text = Convert.ToDateTime(dr["PublishDate"]).ToString("MMMM dd, yyyy");
                    imgFeatured.ImageUrl = dr["FeaturedImage"].ToString();
                }
                con.Close();
            }

            // Load Tags for this blog
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string sql = @"SELECT t.TagName FROM Tags t
                               INNER JOIN BlogTags bt ON t.TagID = bt.TagID
                               WHERE bt.BlogID=@BlogID";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.SelectCommand.Parameters.AddWithValue("@BlogID", blogID);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptTags.DataSource = dt;
                rptTags.DataBind();
            }
        }

        private void LoadCategories()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM Categories";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptCategories.DataSource = dt;
                rptCategories.DataBind();
            }
        }

        private void LoadTags()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM Tags";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptSidebarTags.DataSource = dt;
                rptSidebarTags.DataBind();
            }
        }

        private void LoadRelatedPosts(int blogID)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string sql = @"SELECT TOP 4 * FROM BlogPosts 
                               WHERE BlogID <> @BlogID ORDER BY PublishDate DESC";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.SelectCommand.Parameters.AddWithValue("@BlogID", blogID);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptRelatedPosts.DataSource = dt;
                rptRelatedPosts.DataBind();
            }
        }
    }
}
