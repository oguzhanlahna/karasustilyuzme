<%@ Page Title="Blog" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="karasustilyuzmecom.blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<section class="page-header">
    <div class="container">
        <div class="page-header-item d-flex align-items-center justify-content-center">
            <div class="post-content">
                <h2>Blog</h2>
            </div>
        </div>
    </div>
</section>

<div class="breadcamp">
    <div class="container">
        <ul class="d-flex flex-wrap justify-content-center align-items-center">
            <li><a href="index.html">Home</a></li>
            <li><a class="active">Blog</a></li>
        </ul>
    </div>
</div>

<div class="blog-section style-2 padding-tb">
    <div class="container">
        <div class="section-wrapper row">

            <!-- blog posts -->
            <div class="col-lg-9 col-12 sticky-widget">
                <asp:Repeater ID="rptBlogPosts" runat="server">
                    <ItemTemplate>
                        <article class="post-item">
                            <div class="post-item-inner">
                                <div class="post-thumb">
                                    <a href='<%# "/blogDetay?blogID=" + Eval("BlogID") %>'>
                                        <img src='<%# Eval("FeaturedImage") ?? "assets/images/blog/default.jpg" %>' alt="blog" />
                                    </a>
                                </div>
                                <div class="post-content">
                                    <div class="content-area">
                                        <h5>
                                            <a href='<%# "/blogDetay?blogID=" + Eval("BlogID") %>'>
                                                <%# Eval("Title") %>
                                            </a>
                                        </h5>
                                        <div class="meta-post">
                                            <span class="by">
                                                <a class="date"><%# Convert.ToDateTime(Eval("PublishDate")).ToString("dd MMMM yyyy") %></a>
                                                <a class="name"><%# Eval("CategoryName") %></a>
                                            </span>
                                        </div>
                                        <p>
                                            <%# Eval("Content").ToString().Length > 200 
                                                ? Eval("Content").ToString().Substring(0,200) + "..." 
                                                : Eval("Content") %>
                                        </p>
                                        <a href='<%# "/blogDetay?blogID=" + Eval("BlogID") %>' class="plain-button">Devamını Oku</a>
                                    </div>

                                    <div class="social-area">
                                        <div class="count"><span>Blog</span></div>
                                        <div class="social-media">
                                            <span>Share</span>
                                            <ul>
                                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                                                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- sidebar -->
            <div class="col-lg-3 col-md-6 col-12 sticky-widget">
                <aside>
                    <!-- categories -->
                    <div class="widget widget-category">
                        <h4>Kategoriler</h4>
                        <ul>
                            <asp:Repeater ID="rptCategories" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href='<%# "/blog.aspx?categoryID=" + Eval("CategoryID") %>'>
                                            <%# Eval("CategoryName") %> (<%# Eval("BlogCount") %>)
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>

                    <!-- tags -->
                    <div class="widget widget-tags">
                        <h4>Etiketler</h4>
                        <ul class="tags">
                            <asp:Repeater ID="rptTags" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href='<%# "/blogTags.aspx?tagID=" + Eval("TagID") %>'>
                                            <%# Eval("TagName") %>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </aside>
            </div>

        </div>
    </div>
</div>

</asp:Content>
