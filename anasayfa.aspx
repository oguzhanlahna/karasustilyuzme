<%@ Page Title="Anasayfa" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeFile="anasayfa.aspx.cs"
    Inherits="karasustilyuzmecom.anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- banner section start here -->
<section class="banner style-2" aria-label="Karasu Stil Yüzme Banner">
	<div class="banner-area">
		<div class="container">
			<div class="row padding-x">
                <div class="banner-content">
                    <h2 class="banner-text">Garantili ve Güvenilir Yüzme Eğitimi</h2>
                    <a href="#" class="btn">Hemen Kaydol</a>
                </div>
			</div>
		</div>
	</div>
</section>
<!-- banner section ending here -->

  <!-- services section start here -->
  <section class="services">
      <div class="container">
          <div class="row padding-x">
              <div class="section-wrapper">
                  <div class="services-slider">
                      <div class="swiper-wrapper">
                          <!-- Temel Yüzme Kursları -->
                          <div class="swiper-slide">
                              <div class="post-item">
                                  <div class="post-item-inner">
                                      <div class="post-thumb">
                                          <div class="round-1">
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                          </div>
                                          <div class="round-2"></div>
                                          <div class="service-icon"><i class="fas fa-swimmer"></i></div>
                                      </div>
                                      <div class="post-content">
                                          <h5>Temel Yüzme Kursları</h5>
                                          <p>Başlangıç seviyesindeki öğrenciler için güvenli ve etkili eğitim. Suya alışma, nefes kontrolü ve temel yüzme teknikleri öğretilir.</p>
                                          <a href="#" class="service-flaticon flaticon-next"></a>
                                      </div>
                                  </div>
                              </div>
                          </div>

                          <!-- İleri Seviye Yüzme -->
                          <div class="swiper-slide">
                              <div class="post-item">
                                  <div class="post-item-inner">
                                      <div class="post-thumb">
                                          <div class="round-1">
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                          </div>
                                          <div class="round-2"></div>
                                          <div class="service-icon"><i class="fas fa-medal"></i></div>
                                      </div>
                                      <div class="post-content">
                                          <h5>İleri Seviye Yüzme</h5>
                                          <p>Deneyimli yüzücüler için teknik geliştirme programları. Stil düzeltme, hız ve dayanıklılık artırma çalışmaları içerir.</p>
                                          <a href="#" class="service-flaticon flaticon-next"></a>
                                      </div>
                                  </div>
                              </div>
                          </div>

                          <!-- Bireysel ve Grup Programlar -->
                          <div class="swiper-slide">
                              <div class="post-item">
                                  <div class="post-item-inner">
                                      <div class="post-thumb">
                                          <div class="round-1">
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                          </div>
                                          <div class="round-2"></div>
                                          <div class="service-icon"><i class="fas fa-users"></i></div>
                                      </div>
                                      <div class="post-content">
                                          <h5>Bireysel & Grup Programlar</h5>
                                          <p>Çocuk, yetişkin ve bayanlara özel seanslar. Kişiye özel bireysel dersler ve grup eğitimleri seçenekleri sunuyoruz.</p>
                                          <a href="#" class="service-flaticon flaticon-next"></a>
                                      </div>
                                  </div>
                              </div>
                          </div>

                          <!-- Özel Yarışçı ve Performans Programları -->
                          <div class="swiper-slide">
                              <div class="post-item">
                                  <div class="post-item-inner">
                                      <div class="post-thumb">
                                          <div class="round-1">
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                          </div>
                                          <div class="round-2"></div>
                                          <div class="service-icon"><i class="fas fa-trophy"></i></div>
                                      </div>
                                      <div class="post-content">
                                          <h5>Yarışçı & Performans Programları</h5>
                                          <p>Sporcular için yarış odaklı eğitimler. Hız, teknik, dönüş ve start çalışmaları ile derece ve madalya hedefleyenler için özel programlar.</p>
                                          <a href="#" class="service-flaticon flaticon-next"></a>
                                      </div>
                                  </div>
                              </div>
                          </div>

                          <!-- Öğrenci Destek Hizmeti -->
                          <div class="swiper-slide">
                              <div class="post-item">
                                  <div class="post-item-inner">
                                      <div class="post-thumb">
                                          <div class="round-1">
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                              <div class="services-circle-wrapper"><div class="services-circle"></div></div>
                                          </div>
                                          <div class="round-2"></div>
                                          <div class="service-icon"><i class="fas fa-hands-helping"></i></div>
                                      </div>
                                      <div class="post-content">
                                          <h5>Öğrenci Destek Hizmeti</h5>
                                          <p>Eğitim sürecinde her öğrencimize özel danışmanlık ve rehberlik sağlanır. Başarı ve motivasyon desteklenir.</p>
                                          <a href="#" class="service-flaticon flaticon-next"></a>
                                      </div>
                                  </div>
                              </div>
                          </div>

                      </div>
                  </div>
              </div>

              <div class="services-pagination"></div>
          </div>
      </div>
  </section>
  <!-- services section ending here -->



  <!-- hakkında section start here -->
  <section class="consulting padding-tb">
     <div class="container">
         <div class="row">
             <div class="col-lg-6 col-12">
                 <div class="post-thumb">
                     <div class="cp-thumb">
                         <img src="assets/images/hakkimizda.webp"
                              alt="Karasu Stil Yüzme Hakkımızda"
                              width="900" height="650"
                              loading="lazy" decoding="async" />
                     </div>
                 </div>
             </div>
             <div class="col-lg-6 col-12">
                 <div class="post-content">
                     <h2>Hakkımızda – Karasu Stil Yüzme</h2>
                     <p>
                         Karasu Stil Yüzme olarak misyonumuz, yüzmeyi bir spor dalı olarak benimsetmek,
                         bireylerin fiziksel gelişimlerini desteklemek ve sağlıklı yaşam bilinci kazandırmaktır.
                     </p>
                     <ul>
                         <li><i class="fas fa-check"></i>Deneyimli eğitmenler</li>
                         <li><i class="fas fa-check"></i>Yaş ve seviyeye uygun programlar</li>
                         <li><i class="fas fa-check"></i>Güvenli ve hijyenik havuz</li>
                         <li><i class="fas fa-check"></i>Küçük gruplarda özel ders</li>
                         <li><i class="fas fa-check"></i>Başlangıç ve yarış programları</li>
                         <li><i class="fas fa-check"></i>Ölçülebilir başarı</li>
                     </ul>
                     <a href="#" class="btn">Tüm Kurslarımızı İnceleyin</a>
                 </div>
             </div>
         </div>
     </div>
 </section>
  <!-- consulting section ending here -->



  <!-- counter-up section -->
  <section class="counter-up style-2">
      <div class="container">
          <div class="row">
              <div class="counter-area">
                  <ul>
                      <li>
                          <div class="post-thumb">
                              <div class="post-inner">
                                  <img src="assets/images/yuzme-stilleri/serbeststilyuzme.webp" alt="serbest"
                                       width="260" height="260" loading="lazy" decoding="async" />
                              </div>
                          </div>
                          <div class="post-content">
                              <h4>Serbest Stil</h4>
                              <p>Freestyle</p>
                          </div>
                      </li>
                      <li>
                          <div class="post-thumb">
                              <div class="post-inner">
                                  <img src="assets/images/yuzme-stilleri/sirtustuyuzme.webp" alt="sırtüstü"
                                       width="260" height="260" loading="lazy" decoding="async" />
                              </div>
                          </div>
                          <div class="post-content">
                              <h4>Sırtüstü Stil</h4>
                              <p>Backstroke</p>
                          </div>
                      </li>
                      <li>
                          <div class="post-thumb">
                              <div class="post-inner">
                                  <img src="assets/images/yuzme-stilleri/kurbagalama.webp" alt="kurbağlama"
                                       width="260" height="260" loading="lazy" decoding="async" />
                              </div>
                          </div>
                          <div class="post-content">
                              <h4>Kurbağalama</h4>
                              <p>Breaststroke</p>
                          </div>
                      </li>
                      <li>
                          <div class="post-thumb">
                              <div class="post-inner">
                                  <img src="assets/images/yuzme-stilleri/kelebekstilyuzme.webp" alt="kelebek"
                                       width="260" height="260" loading="lazy" decoding="async" />
                              </div>
                          </div>
                          <div class="post-content">
                              <h4>Kelebek</h4>
                              <p>Butterfly</p>
                          </div>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
  </section>
  <!-- counter-up section ending -->


  <!-- achievement section start here -->
  <section class="achievement padding-tb">
	<div class="container">
		<div class="row padding-x">

			<div class="counter-up">
				<div class="section-header">
					<h2>Karasu Stil’de Başarı; Sadece Derece Değil, Gelişimdir</h2>
					<p>
						Sakarya Karasu’da 365 gün açık ısıtmalı yarı olimpik havuzumuzda; çocuk, yetişkin,
						bayanlara özel ve performans gruplarında sistemli eğitimle ilerliyoruz.
					</p>
				</div>

				<div class="section-wrapper">
					<div class="counter-area">
						<div class="content-item">
							<span class="counter">365</span>
							<span class="count-view">gün</span>
							<p>Yaz-Kış Açık Havuz</p>
						</div>

						<div class="content-item">
							<span class="counter">4</span>
							<span class="count-view">+</span>
							<p>Farklı Kurs Grubu</p>
						</div>

						<div class="content-item">
							<span class="counter">100</span>
							<span class="count-view">%</span>
							<p>Seviye Odaklı Eğitim</p>
						</div>
					</div>
				</div>
			</div>

			<div class="achive-area">
				<div class="achive-slider">
					<div class="swiper-wrapper">

						<!-- Slide 1 -->
						<div class="swiper-slide">
							<div class="post-item">
								<div class="post-item-inner">

									<!--
									<div class="post-thumb">
										<img src="assets/images/achievement/slider/01.png"
										     alt="Karasu Stil - Su Korkusunu Yenme">
									</div>
									-->

									<div class="post-content">
										<h4>Su Korkusunu Yenme Programı</h4>
										<p>Güvenli suya alışma, doğru nefes ve temel tekniklerle kısa sürede özgüvenli yüzme.</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Slide 2 -->
						<div class="swiper-slide">
							<div class="post-item">
								<div class="post-item-inner">

									<!--
									<div class="post-thumb">
										<img src="assets/images/achievement/slider/02.png"
										     alt="Karasu Stil - Çocuk Yüzme Kursu">
									</div>
									-->

									<div class="post-content">
										<h4>Çocuklarda Teknik Temel</h4>
										<p>Yaşa ve seviyeye uygun gruplarla su güvenliği ve doğru yüzme temeli.</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Slide 3 -->
						<div class="swiper-slide">
							<div class="post-item">
								<div class="post-item-inner">

									<!--
									<div class="post-thumb">
										<img src="assets/images/achievement/slider/03.png"
										     alt="Karasu Stil - Yetişkin Yüzme">
									</div>
									-->

									<div class="post-content">
										<h4>Yetişkinlerde Hızlı Gelişim</h4>
										<p>Temelden teknik gelişime uzanan planlı eğitimle kontrollü ve rahat yüzme.</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Slide 4 -->
						<div class="swiper-slide">
							<div class="post-item">
								<div class="post-item-inner">

									<!--
									<div class="post-thumb">
										<img src="assets/images/achievement/slider/04.png"
										     alt="Karasu Stil - Performans Grubu">
									</div>
									-->

									<div class="post-content">
										<h4>Performans / Yarışmacı Grup</h4>
										<p>Teknik + kondisyon odaklı antrenmanlarla hedefe yönelik gelişim.</p>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="achive-pagination"></div>
				</div>
			</div>

		</div>
	</div>
</section>
  <!-- achievement section ending here -->


   <!-- kurslar study section start here -->
   <section class="case-study padding-tb" style="background: #f9fafb;">
    <div class="container">
        <div class="row padding-x">
            <div class="case-left">
                <div class="section-header">
                    <h2>Sakarya Karasu’da 365 Gün Isıtmalı Havuzda Yüzme Eğitimi</h2>
                    <p>
                        Karasu Stil Yüzme Eğitim Merkezi; yaz-kış açık <strong>ısıtmalı yarı olimpik havuz</strong> ile
                        <strong>çocuk yüzme kursu</strong>, <strong>yetişkin yüzme kursu</strong>, <strong>bayanlara özel</strong> gruplar ve
                        <strong>performans / yarışmacı</strong> programları sunar. Seviyenize uygun planla güvenli ve hızlı gelişim.
                    </p>
                </div>
                <div class="section-wrapper">
                    <div class="post-thumb">
                        <img src="assets/images/yuzme-stilleri/kelebekstilyuzme.webp" alt="Karasu Stil Yüzme - Isıtmalı Yarı Olimpik Havuz">
                    </div>
                </div>
            </div>

            <div class="case-right">
                <div class="case-slider">
                    <div class="swiper-wrapper">

                        <!-- Slide 1 -->
                        <div class="swiper-slide">
                            <div class="post-item">
                                <div class="post-item-inner">
                                    <div class="post-thumb">
                                        <div class="company-logo">
                                            <a href="kurslarimiz.aspx">
                                                <img src="assets/images/yuzme-stilleri/serbeststilyuzme.webp" alt="Karasu Stil Yüzme Kursları">
                                            </a>
                                        </div>
                                        <div class="company-name">
                                            <h3><a href="kurslarimiz.aspx">Birebir Yüzme Dersleri</a></h3>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <p>
                                            Su korkusunu yenmek, doğru nefes ve teknikle kısa sürede ilerlemek isteyenler için
                                            kişiye özel program. Hedefe göre planlanan antrenmanlarla hızlı gelişim.
                                        </p>
                                        <ul>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=1">Hedef</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Suya alışma, temel teknikler, doğru nefes ve güvenli yüzme becerisi.</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=1">Uygulama</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Seviyeye göre birebir çalışma, teknik düzeltmeler ve kişisel takip.</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=1">Sonuç</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Kısa sürede daha rahat ve kontrollü yüzme, özgüven artışı.</p>
                                                </div>
                                            </li>
                                        </ul>
                                        <a href="kurslarimiz-detay.aspx?kursID=1" class="text-btn">Detayları Gör</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Slide 2 -->
                        <div class="swiper-slide">
                            <div class="post-item">
                                <div class="post-item-inner">
                                    <div class="post-thumb">
                                        <div class="company-logo">
                                            <a href="kurslarimiz.aspx">
                                                <img src="assets/images/yuzme-stilleri/sirtustuyuzme.webp" alt="Çocuk Yüzme Kursu - Karasu Stil">
                                            </a>
                                        </div>
                                        <div class="company-name">
                                            <h3><a href="kurslarimiz.aspx">Çocuk Yüzme Kursu</a></h3>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <p>
                                            Çocuklar için yaş ve seviyeye uygun gruplarla güvenli, eğlenceli ve disiplinli eğitim.
                                            Temel yüzme becerilerinden teknik gelişime kadar adım adım ilerleme.
                                        </p>
                                        <ul>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=2">Hedef</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Su güvenliği, temel koordinasyon, doğru vuruş ve nefes alışkanlığı.</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=2">Uygulama</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Seviye grupları, düzenli takip ve gelişime göre program güncelleme.</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=2">Sonuç</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Daha güçlü teknik temel ve özgüvenli yüzme alışkanlığı.</p>
                                                </div>
                                            </li>
                                        </ul>
                                        <a href="kurslarimiz-detay.aspx?kursID=2" class="text-btn">Detayları Gör</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Slide 3 -->
                        <div class="swiper-slide">
                            <div class="post-item">
                                <div class="post-item-inner">
                                    <div class="post-thumb">
                                        <div class="company-logo">
                                            <a href="kurslarimiz.aspx">
                                                <img src="assets/images/yuzme-stilleri/kurbagalama.webp" alt="Performans ve Yarışmacı Grup - Karasu Stil">
                                            </a>
                                        </div>
                                        <div class="company-name">
                                            <h3><a href="kurslarimiz.aspx">Performans / Yarışmacı Grup</a></h3>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <p>
                                            Spor amaçlı yüzme yapanlar ve derece hedefleyenler için teknik + kondisyon odaklı program.
                                            Düzenli antrenman planı, disiplinli takip ve hedefe yönelik ilerleme.
                                        </p>
                                        <ul>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=3">Hedef</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Teknik verimlilik, hız, dayanıklılık ve yarışma hazırlığı.</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=3">Uygulama</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Planlı setler, teknik analiz, kondisyon ve tempo çalışmaları.</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="case-button">
                                                    <a href="kurslarimiz-detay.aspx?kursID=3">Sonuç</a>
                                                </div>
                                                <div class="case-details">
                                                    <p>Daha iyi derece, daha güçlü teknik ve sürdürülebilir performans.</p>
                                                </div>
                                            </li>
                                        </ul>
                                        <a href="kurslarimiz-detay.aspx?kursID=3" class="text-btn">Detayları Gör</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="case-pagination"></div>
                </div>
            </div>

        </div>
    </div>
</section>
   <!-- case study section ending here -->


   <!-- Blog -->
   <section class="blog-section padding-tb">
     <div class="container">

         <div class="section-header">
             <h2>Stil Blog</h2>
             <p>Karasu Stil Yüzme Eğitim Merkezi’nden en güncel yüzme eğitimleri, duyurular ve faydalı bilgiler.</p>
         </div>

         <div class="section-wrapper">
             <div class="blog-slider">
                 <div class="swiper-wrapper">

                     <asp:Repeater ID="rptHomePopularBlogs" runat="server">
                         <ItemTemplate>
                             <div class="swiper-slide">
                                 <div class="post-item">
                                     <div class="post-item-inner">

                                         <div class="post-thumb">
                                             <a href='<%# "/blogDetay?blogID=" + Eval("BlogID") %>'>
                                                 <img src='<%# (Eval("FeaturedImage") == DBNull.Value || Eval("FeaturedImage") == null || string.IsNullOrWhiteSpace(Eval("FeaturedImage").ToString())) ? "assets/images/blog/default.jpg" : Eval("FeaturedImage").ToString() %>'
                                                      alt='<%# Eval("Title") %>'
                                                      width="600" height="400"
                                                      loading="lazy" decoding="async" />
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
                                                         <a class="date" href="#">
                                                             <%# Convert.ToDateTime(Eval("PublishDate")).ToString("dd MMMM yyyy") %>
                                                         </a>
                                                         <a class="name" href="#">Karasu Stil Yüzme</a>
                                                     </span>
                                                 </div>
                                             </div>

                                             <div class="social-area">
                                                 <div class="count"><span>Blog</span></div>
                                                 <div class="social-media">
                                                     <span>Share</span>
                                                     <ul>
                                                         <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                                         <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                                         <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                                     </ul>
                                                 </div>
                                             </div>

                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </ItemTemplate>
                     </asp:Repeater>

                 </div>

                 <div class="blog-pagination"></div>
             </div>
         </div>

     </div>
 </section>

</asp:Content>
