        <div class="navbar-fixed">
            <style type="text/css" scoped>
                @media only screen and (max-width: 992px) {nav .brand-logo {left: 11rem;}}
                nav .user-details-name i {height: 4rem; line-height: 4rem;}
                nav .user-details-extra i {font-size: 1.25rem;}
            </style>
            <nav class="purple lighten-3">
                <div class="nav-wrapper">
                    <ul class="left">
                      <li><h1 class="logo-wrapper"><a href="#" onclick="location.replace('index.jsp')" class="brand-logo darken-1"><img src="images/growth-logo-full.png" alt="company logo"></a> <span class="logo-text">Growth Tree</span></h1></li>
                    </ul>
                    <ul class="right hide-on-small-only">
                        <li class="tooltipped" data-tooltip="Help"><a href="#"><i class="mdi-communication-live-help"></i></a></li>
                    </ul>
                    <ul class="user-details purple lighten-2 right">
                        <li class="user-details-name tooltipped truncate" data-tooltip="Profile"><a href="#"><i class="material-icons left">person_pin</i><span class="user-name hide-on-small-only"><%= session.getAttribute("userid") %></span> <span class="user-role hide-on-med-and-down"></span></a></li>
                        <li class="user-details-extra tooltipped hide-on-small-only" data-tooltip="Security"><a href="#" onclick="AS.showUserDashboard(); Materialize.toast('<p>This popup shows the default user page provided by <b>Account Shield</b> - refer to the Documentation to see how it can be customized<br><br>For an alternative approach, click User Security from the left side menu</p>', 10000, 'guide')"><i class="mdi-action-lock-outline"></i></a></li>
                        <li class="user-details-extra tooltipped hide-on-small-only" data-tooltip="Logout"><a href="#" onclick="location.replace('_logout-process.jsp')"><i class="mdi-hardware-keyboard-tab"></i></a></li>
                    </ul>
                </div>
            </nav>
        </div>
