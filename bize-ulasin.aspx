<%@ Page Title="Bize Ulaşın" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeFile="bize-ulasin.aspx.cs"
    Inherits="karasustilyuzmecom.bize_ulasin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- page header section start here -->
    <section class="page-header py-5 bg-light">
        <div class="container text-center">
            <div class="post-content">
                <h2>Bize Ulaşın</h2>
                <p>Karasu Stil Yüzme Eğitim Merkezi ile iletişime geçin</p>
            </div>
        </div>
    </section>
    <!-- page header section ending here -->

    <!-- breadcrumb section start here -->
    <div class="breadcamp py-3 bg-white border-bottom">
        <div class="container">
            <ul class="d-flex flex-wrap justify-content-center align-items-center mb-0 list-unstyled">
                <li><a href="Default.aspx" class="text-muted">Anasayfa</a></li>
                <li class="mx-2">/</li>
                <li class="active fw-bold">Bize Ulaşın</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb section ending here -->

    <!-- contact us section start here -->
    <div class="contact style-2 padding-tb">
        <div class="container">
            <div class="section-wrapper row justify-content-center">

                <!-- SOL: FORM -->
                <div class="col-lg-8 col-12">
                    <div class="contact-part">
                        <div class="contact-title">
                            <h4>Karasu Stil Yüzme ile İletişime Geçin</h4>
                        </div>

                        <!-- ✅ mesaj alanı -->
                        <asp:Literal ID="litFormMessage" runat="server" />

                        <!-- ✅ SENİN ORİJİNAL FORM WRAPPER'IN -->
                        <div class="contact-form d-flex flex-wrap justify-content-between">

                            <asp:TextBox ID="txtName" runat="server" placeholder="Your Name" />

                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Your Email" />

                            <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" placeholder="Phone" />

                            <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject" />

                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="7" placeholder="Enter Your Message" />

                            <asp:Button ID="btnSend" runat="server"
                                CssClass="btn"
                                Text="Send Message"
                                OnClick="btnSend_Click"
                                UseSubmitBehavior="false" />
                        </div>
                    </div>
                </div>

                <!-- SAĞ: ADRES / SAATLER / SOSYAL (SENİN ORİJİNAL KISIM) -->
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="info-part">
                        <ul class="schedule">
                            <li><i class="far fa-clock"></i>Pzt - Per : 09:00 - 22:00</li>
                            <li><i class="fas fa-lock"></i>Cuma : <span>Kapalı</span></li>
                            <li><i class="far fa-clock"></i>Cts - Paz : 09:00 - 22:00</li>
                        </ul>

                        <div class="contact-info">
                            <h4>Adresimiz</h4>
                            <p>Aziziye, Huzur Cd. No:6/1</p>
                            <p class="style-2">54500 Karasu/Sakarya</p>

                            <a href="https://www.google.com/maps/search/?api=1&amp;query=Aziziye,+Huzur+Cd.+No:6/1,+54500+Karasu/Sakarya,+Türkiye"
                               target="_blank">Google Haritalarda Bul</a>

                            <ul class="details">
                                <li>
                                    <p>Email</p>
                                    <a href="mailto:akademi@karasustilyuzme.com">
                                        akademi@karasustilyuzme.com
                                    </a>
                                </li>
                                <li>
                                    <p>Telefon</p>
                                    <a href="tel:+905536640754">
                                        +90 553 664 0754
                                    </a>
                                </li>
                            </ul>

                            <ul class="social-media-icons">
                                <li>
                                    <a class="facebook" href="https://www.facebook.com/karasustilyuzme/" target="_blank">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="instagram" href="https://www.instagram.com/karasustilyuzme" target="_blank">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="pinterest" href="https://tr.pinterest.com/karasustilyuzme/" target="_blank">
                                        <i class="fab fa-pinterest-p"></i>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- contact us section ending here -->

</asp:Content>