<%@ Page Title="Kurslarımız" 
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="kurslarimiz.aspx.cs"
    Inherits="karasustilyuzmecom.kurslarimiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- Page Header -->
<section class="page-header service-page-header">
    <div class="container">
        <div class="page-header-item d-flex align-items-center justify-content-center">
            <div class="post-content style-two">
                <h5>Kurslarımız</h5>
                <h2>Sakarya Karasu’da Profesyonel Yüzme Kursları ile Güvenli ve Garantili Eğitim</h2>
                <p>Karasu Stil Yüzme Eğitim Merkezi olarak 365 gün açık ısıtmalı yarı olimpik havuzumuzda, her yaşa ve seviyeye uygun bireysel, grup ve performans odaklı yüzme eğitimleri sunuyoruz.</p>
            </div>
        </div>
    </div>
</section>


    <!-- Courses Section -->
    <section class="case-study style-3 padding-tb">
        <div class="container">

<%--            <!-- Filter Buttons -->
            <ul class="post-nav">
                <li data-filter="*" class="active">Tümü</li>
                <li data-filter=".beginner">Başlangıç</li>
                <li data-filter=".advanced">İleri Seviye</li>
                <li data-filter=".kids">Çocuk</li>
                <li data-filter=".adult">Yetişkin</li>
            </ul>--%>

            <!-- Courses List -->
            <div class="section-wrapper">
                <asp:Repeater ID="rptCourses" runat="server">
                    <ItemTemplate>
                        <div class='post-item <%# Eval("CssClass") %>'>
                            <div class="post-inner">
                                <div class="post-thumb">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("KursTitle") %>' />
                                </div>
                                <div class="post-content">
                                    <p><%# Eval("ShortDescription") %></p>
                                    <h5>
                                        <a href='<%# Eval("DetailUrl") %>'>
                                            <%# Eval("KursTitle") %>
                                        </a>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
    </section>

</asp:Content>
