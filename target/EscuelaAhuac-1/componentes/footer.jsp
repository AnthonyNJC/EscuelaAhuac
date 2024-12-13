<footer class="py-4">
    <div class="container">
        <div class="footer-separator mb-4"></div>
        <div class="row">
            <div class="col-md-4">
                <h5 class="mb-3 text-warning">Información</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="#section5">Sobre nosotros</a></li>
                    <li class="mb-2"><a href="#admissions">Matricula</a></li>
                    <li class="mb-2"><a href="#academics">Académicos</a></li>
                    <li class="mb-2"><a href="#contact">Contacto</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5 class="mb-3 text-warning">Actividades</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="#events">Eventos</a></li>
                    <li class="mb-2"><a href="#news">Noticias</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5 class="mb-3 text-warning">Contacto</h5>
                <p class="mb-2">
                    Dirección: Tupac Amaru con Minerva<br>
                    Chupaca-ahuac<br>
                    Numero de Contacto: 964 862 222<br>
                   <!--  Teléfono: (123) 456-7890<br>
                    Email: <a href="mailto:info@colegioejemplo.edu">info@colegioejemplo.edu</a> -->
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <p class="mt-3"><i class="fa fa-copyright"></i> Colegio Nuestra Señora de Fatima 
                   
                </p>
            </div>
        </div>
    </div>
</footer>





  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/video.js"></script>
    <script src="assets/js/slick-slider.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .scroll-to-section').on('click', 'a', function (e) {
          if($(e.target).hasClass('external')) {
            return;
          }
          e.preventDefault();
          $('#menu').removeClass('active');
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
</body>
</html>