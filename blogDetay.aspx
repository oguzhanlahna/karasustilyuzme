<%@ Page Title="Blog Detay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="blogDetay.aspx.cs" Inherits="karasustilyuzmecom.blogDetay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- Sayfa Başlığı -->
<section class="page-header">
    <div class="container">
        <div class="page-header-item d-flex align-items-center justify-content-center">
            <div class="post-content">
                <h2><asp:Literal ID="litBlogTitle" runat="server"></asp:Literal></h2>
            </div>
        </div>
    </div>
</section>

<div class="breadcamp">
    <div class="container">
        <ul class="d-flex flex-wrap justify-content-center align-items-center">
            <li><a href="index.aspx">Ana Sayfa</a></li>
            <li><a class="active">Blog</a></li>
        </ul>
    </div>
</div>

<!-- Blog Bölümü -->
<div class="blog-section style-2 blog-single">
    <div class="container">
        <div class="section-wrapper row">

            <!-- Ana Blog Yazısı -->
            <div class="col-lg-9 col-12 sticky-widget">
                <article>
                    <div class="post-item">
                        <div class="post-item-inner">
                            <div class="post-thumb">
                                <asp:Image ID="imgFeatured" runat="server" CssClass="img-fluid" />
                            </div>
                            <div class="post-content">
                                <div class="content-area">
                                    <div class="meta-post">
                                        <span class="by">
                                            <asp:Label ID="lblPublishDate" runat="server" CssClass="date"></asp:Label>
                                            <asp:Label ID="lblAuthor" runat="server" CssClass="name"></asp:Label>
                                        </span>
                                    </div>
                                    <asp:Literal ID="litContent" runat="server"></asp:Literal>

                                    <h6 class="tag-title">Etiketler</h6>
                                    <asp:Repeater ID="rptTags" runat="server">
                                        <ItemTemplate>
                                            <li><a href="#"><%# Eval("TagName") %></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <h6 class="share-title">Paylaş</h6>
                                    <ul class="social-media-icons">
                                        <li><a class="facebook" href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                        <li><a class="twitter" href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                        <li><a class="linkedin" href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
                                        <li><a class="youtube" href="#" target="_blank"><i class="fab fa-youtube"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- İlgili Yazılar -->
                    <div class="related-post">
                        <h3>İlgili Yazılar</h3>
                        <div class="row">
                            <asp:Repeater ID="rptRelatedPosts" runat="server">
                                <ItemTemplate>
                                    <div class="col-xl-6 col-12">
                                        <div class="post-item">
                                            <div class="post-inner">
                                                <div class="post-thumb">
                                                    <a href='blogDetay.aspx?blogID=<%# Eval("BlogID") %>'>
                                                        <img src='<%# Eval("FeaturedImage") %>' alt="ilgili-blog" />
                                                    </a>
                                                </div>
                                                <div class="post-content">
                                                    <h5><a href='blogDetay.aspx?blogID=<%# Eval("BlogID") %>'><%# Eval("Title") %></a></h5>
                                                    <p><%# Eval("PublishDate", "{0:dd MMMM yyyy}") %></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                </article>
            </div>

            <!-- Sidebar -->
            <div class="col-lg-3 col-md-6 col-12 sticky-widget">
                <aside>

                    <div class="widget widget-post">
                        <h4>Popüler Yazılar</h4>
                        <asp:Repeater ID="rptPopularPosts" runat="server">
                            <ItemTemplate>
                                <ul>
                                    <li>
                                        <h6>
                                            <a href='<%# "/blogDetay.aspx?blogID=" + Eval("BlogID") %>'>
                                                <%# Eval("Title") %>
                                            </a>
                                        </h6>
                                        <p><%# Convert.ToDateTime(Eval("PublishDate")).ToString("dd MMMM yyyy") %></p>
                                    </li>
                                </ul>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Kategoriler -->
                    <div class="widget widget-category">
                        <h4>Kategoriler</h4>
                        <asp:Repeater ID="rptCategories" runat="server">
                            <ItemTemplate>
                                <li><a href='blogKategori.aspx?catID=<%# Eval("CategoryID") %>'><%# Eval("CategoryName") %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Etiketler -->
                    <div class="widget widget-tags mb-0">
                        <h4>Etiketler</h4>
                        <asp:Repeater ID="rptSidebarTags" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a href='blogTags.aspx?tagID=<%# Eval("TagID") %>'><%# Eval("TagName") %></a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </aside>
            </div>

        </div>
    </div>
</div>

</asp:Content>
