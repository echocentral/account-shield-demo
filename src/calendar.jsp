{% include "_jsp-head.jsp" %}
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Growth Tree - Calendar</title>
  {% include "_head.html" %}

  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="js/plugins/chartist-js/chartist.min.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="js/plugins/fullcalendar/css/fullcalendar.min.css" type="text/css" rel="stylesheet" media="screen,projection">
</head>

<body>
  <!-- Start Page Loading -->
    <div id="loader-wrapper">
        <div id="loader"></div>        
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
    <!-- End Page Loading -->

  <!-- //////////////////////////////////////////////////////////////////////////// -->

  <!-- START HEADER -->
  <header id="header" class="page-topbar">
    <!-- start header nav-->
    {% include "_jsp-topnav.jsp" %}
    <!-- end header nav-->
  </header>
  <!-- END HEADER -->

  <!-- //////////////////////////////////////////////////////////////////////////// -->

  <!-- START MAIN -->
  <div id="main">
    <!-- START WRAPPER -->
    <div class="wrapper">
      <!-- START LEFT SIDEBAR NAV-->
      {% include "_jsp-sidenav.html" with {option:3} %}
      <!-- END LEFT SIDEBAR NAV-->
      <!-- //////////////////////////////////////////////////////////////////////////// -->

      <!-- START CONTENT -->
      <section id="content">
        
        <!--breadcrumbs start-->
        <div id="breadcrumbs-wrapper" class=" grey lighten-3">
          <div class="container">
            <div class="row">
              <div class="col s12 m12 l12">
                <h3 class="breadcrumbs-title">Calendar</h3>
                <p>See and manage your schedule</p>
              </div>
            </div>
          </div>
        </div>
        <!--breadcrumbs end-->
        
        <!--start container-->
        <div class="container">
          <div class="section">
            <div id="full-calendar">              
              <div class="row">
                <div class="col s12 m8 l9">
                  <div id='calendar' class="white z-depth-1"></div>
                </div>
                <div class="col s12 m4 l3">
                  <div id='external-events'>    
                    <h4 class="header">Draggable Events</h4>
                    <div class='fc-event cyan'>Dividend due</div>
                    <div class='fc-event teal'>Monthly income</div>
                    <div class='fc-event cyan darken-1'>Monthly expense</div>
                    <div class='fc-event cyan accent-4'>Regular transfer</div>
                    <div class='fc-event teal accent-4'>Sell order</div>
                    <div class='fc-event light-blue accent-3'>Buy order</div>
                    <div class='fc-event light-blue accent-4'>Other</div>
                    <p>
                      <input type='checkbox' id='drop-remove' />
                      <label for='drop-remove'>remove after drop</label>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--end container-->

      </section>
      <!-- END CONTENT -->

    </div>
    <!-- END WRAPPER -->

  </div>
  <!-- END MAIN -->

  <!-- //////////////////////////////////////////////////////////////////////////// -->

  <!-- START FOOTER -->
  {% include "_footer.html" %}
  <!-- END FOOTER -->

  <!--  Scripts-->
  {% include "_jsp-tail.jsp" %}

  <!--scrollbar-->
  <script type="text/javascript" src="js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    
  <!-- chartist -->
  <script type="text/javascript" src="js/plugins/chartist-js/chartist.min.js"></script>   

  <!-- Calendar Script -->
  <script type="text/javascript" src="js/plugins/fullcalendar/lib/jquery-ui.custom.min.js"></script>
  <script type="text/javascript" src="js/plugins/fullcalendar/lib/moment.min.js"></script>
  <script type="text/javascript" src="js/plugins/fullcalendar/js/fullcalendar.min.js"></script>
  <script type="text/javascript" src="js/plugins/fullcalendar/fullcalendar-script.js"></script>

  <!--plugins.js - Some Specific JS codes for Plugin Settings-->
  <script type="text/javascript" src="js/plugins.js"></script>   
</body>

</html>