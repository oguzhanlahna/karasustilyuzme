<%@ Page Title="Kurs Detay" Language="C#" MasterPageFile="~/Site.Master"  
    AutoEventWireup="true" CodeBehind="kurslarimiz_detay.aspx.cs"
    Inherits="karasustilyuzmecom.kurslarimiz_detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <div class="page-header-item d-flex align-items-center justify-content-center">
                <div class="post-content">
                    <h2><asp:Literal ID="ltTitle" runat="server" /></h2>
                </div>
            </div>
        </div>
    </section>

    <!-- Breadcrumb -->
    <div class="breadcamp">
        <div class="container">
            <ul class="d-flex flex-wrap justify-content-center align-items-center">
                <li><a href="index.aspx">Anasayfa</a></li>
                <li><a class="active"><asp:Literal ID="ltBreadTitle" runat="server" /></a></li>
            </ul>
        </div>
    </div>

    <!-- Kurs Detay -->
    <section class="case-study-single padding-tb">
        <div class="container">

            <div class="head-cover">
                <div class="section-header">
                    <h2><asp:Literal ID="ltDetailTitle" runat="server" /></h2>
                    <p class="meta-post">
                        <span>
                            <i class="far fa-clock"></i>
                            <asp:Literal ID="ltDate" runat="server" />
                        </span>
                        <span>
                            Eğitmen:
                            <asp:Literal ID="ltEgitmen" runat="server" />
                        </span>
                        <span>
                            Kategori:
                            <asp:Literal ID="ltKategori" runat="server" />
                        </span>
                    </p>
                </div>

                <div class="post-thumb">
                    <asp:Image ID="imgKurs" runat="server" />
                </div>
            </div>

            <div class="section-wrapper row justify-content-center">
                <div class="col-lg-8 col-12">
                    <article>
                        <div class="case-info">
                            <h3>Kurs Bilgileri</h3>
                            <asp:Literal ID="ltDescription" runat="server" />
                        </div>

                        <div class="task-challenge">
                            <h3>Görev ve Zorluklar</h3>
                            <asp:Literal ID="ltChallenges" runat="server" />
                        </div>

                        <div class="action-solution">
                            <h3>Çözümler ve Uygulamalar</h3>
                            <asp:Literal ID="ltSolutions" runat="server" />
                        </div>

                        <div class="result">
                            <h3>Sonuçlar</h3>
                            <asp:Literal ID="ltResults" runat="server" />
                        </div>
                    </article>
                </div>

                <!-- Sidebar -->
                <div class="col-lg-4 col-md-8 col-12">
                    <aside>
                        <!-- Eğitmen -->
                        <div class="case-mantor">
                            <h3>Eğitmen</h3>
                            <asp:Image ID="imgEgitmen" runat="server" />
                            <h4><asp:Literal ID="ltEgitmenSidebar" runat="server" /></h4>
                            <p><asp:Literal ID="ltEgitmenDesc" runat="server" /></p>
                        </div>

                        <!-- Diğer Kurslar -->
                        <div class="more-case">
                            <h3>Diğer Kurslar</h3>
                            <ul>
                                <asp:Repeater ID="rptOtherCourses" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <a href='kurslarimiz-detay.aspx?kursID=<%# Eval("KursID") %>'>
                                                <%# Eval("KursTitle") %>
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
    </section>

</asp:Content>
