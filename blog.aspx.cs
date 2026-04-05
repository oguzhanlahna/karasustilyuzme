using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace karasustilyuzmecom
{
    public partial class blog : Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int categoryID;
                int tagID;

                if (int.TryParse(Request.QueryString["categoryID"], out categoryID))
                {
                    BindBlogPostsByCategory(categoryID);
                }
                else if (int.TryParse(Request.QueryString["tagID"], out tagID))
                {
                    BindBlogPostsByTag(tagID);
                }
                else
                {
                    BindAllBlogPosts();
                }

                BindCategories();
                BindTags();
            }
        }

        private void BindAllBlogPosts()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT b.BlogID, b.Title, b.Content, b.FeaturedImage, b.PublishDate,
                           c.CategoryName
                    FROM BlogPosts b
                    LEFT JOIN Categories c ON b.CategoryID = c.CategoryID
                    ORDER BY b.PublishDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBlogPosts.DataSource = dt;
                rptBlogPosts.DataBind();
            }
        }

        private void BindBlogPostsByCategory(int categoryID)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT b.BlogID, b.Title, b.Content, b.FeaturedImage, b.PublishDate,
                           c.CategoryName
                    FROM BlogPosts b
                    LEFT JOIN Categories c ON b.CategoryID = c.CategoryID
                    WHERE b.CategoryID = @CategoryID
                    ORDER BY b.PublishDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@CategoryID", categoryID);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBlogPosts.DataSource = dt;
                rptBlogPosts.DataBind();
            }
        }

        private void BindBlogPostsByTag(int tagID)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT b.BlogID, b.Title, b.Content, b.FeaturedImage, b.PublishDate,
                           c.CategoryName
                    FROM BlogPosts b
                    INNER JOIN BlogTags bt ON b.BlogID = bt.BlogID
                    INNER JOIN Tags t ON bt.TagID = t.TagID
                    LEFT JOIN Categories c ON b.CategoryID = c.CategoryID
                    WHERE t.TagID = @TagID
                    ORDER BY b.PublishDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@TagID", tagID);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBlogPosts.DataSource = dt;
                rptBlogPosts.DataBind();
            }
        }

        private void BindCategories()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT c.CategoryID, c.CategoryName, COUNT(b.BlogID) AS BlogCount
                    FROM Categories c
                    LEFT JOIN BlogPosts b ON b.CategoryID = c.CategoryID
                    GROUP BY c.CategoryID, c.CategoryName
                    ORDER BY c.CategoryName";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptCategories.DataSource = dt;
                rptCategories.DataBind();
            }
        }

        private void BindTags()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT t.TagID, t.TagName
                    FROM Tags t
                    INNER JOIN BlogTags bt ON t.TagID = bt.TagID
                    GROUP BY t.TagID, t.TagName
                    ORDER BY t.TagName";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptTags.DataSource = dt;
                rptTags.DataBind();
            }
        }
    }
}
