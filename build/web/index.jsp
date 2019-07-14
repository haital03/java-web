<%@page import="mydatabase.DBOperations"%>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>ThinkBits</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">


        <link rel="stylesheet" href="assets/css/slicknav.min.css">
        <link rel="stylesheet" href="assets/css/fonticons.css">
        <link rel="stylesheet" href="assets/fontcss/style.css">
        <link rel="stylesheet" href="assets/fonts/stylesheet.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


        <!--For Plugins external css-->
        <link rel="stylesheet" href="assets/css/plugins.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="assets/css/stylein.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <style>
            p{font-size: 16px;font-family: arial;}
            section p{font-size: 16px;}
            section h3{font-size: 20px;}
            section h2{font-size:22px;}
        </style>
    </head>
    <body data-spy="scroll" data-target="#navmenu">
        <div class='preloader'><div class='loaded'>&nbsp;</div></div>
        <%
            DBOperations dbObj = new DBOperations();
            dbObj.createTables();
        %>
        <!--Home page style-->
        <header class="header navbar-fixed-top">
            <div class="navbar navbar-default main-menu">

                <div class="container">
                    <div class="navbar-header">
                        <a  href="" class="navbar-brand" style="height:50px;"><img src="assets/images/iconfinal.jpg" alt="Logo" /></a>

                    </div>
                    <div class="collapse navbar-collapse">

                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                               <input type="text" class="form-control" placeholder="Search" size="30" style="color:white;height:47px; line-height:45px;color:white;">
								<a href="" class="btn_search" style="height:46px; line-height:45px;"><i class="fa fa-search"></i></a>
								<a href="login.jsp"  class="btn_buy" style="font-weight:bold;">Login</a>
								<a href="signup.jsp" class="btn_buy" style="font-weight:bold;">Sign Up</a>
                            </div>
                        </form>
                    </div>

                </div>
            </div> 
        </header><!-- end of navbar -->



        <section id="home" class="home">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-7 col-sm-offset-5">
                            <div class="main_home wow fadeInUp" data-wow-duration="700ms">
                                <h1 style="font-family:Comic Sans MS;">Action is the real measure of intelligence.</h1>
								<p>Welcome To A Place To Share Knowledge And Better Understand The World!!</p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="about" class="about">
            <div class="container">
                <div class="row">
                    <div class="main_about_area">
                        <div class="col-sm-6">
                            <div class="single_about_left">
                                <h2 style="font-size:30px;">Super Duper & such</h2>
                                <p>Get your queries answered quickly and view the highest rated one.</p>
                                
                                <a href="login.jsp" id="haitalbtn" class="btn btn-primary">See More</a>

                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="single_about_right">
                                <div class="single_about_img">
                                    <img src="assets/images/index1.png" alt="" style="border-radius:18px;"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section id="features" class="feature">
            <div class="container">
                <div class="row">
                    <div class="main_feature_area sections border_bottom_raund">
                        <div class="col-sm-4">
                            <div class="single_feature">
                                <h3 style="font-size: 28px;">Get to know More</h3>
                                <h5 class="subtitle" style="font-size: 18px;font-family: arial;color:gray;">User friendly platform to share your views, know others views and review them.</h5>
                                <br><p style="font-size:15px;">Post your queries, get them answered and answer queries posted by others. Moreover, comment 
								and rate answers by the users.</p>

                                <a href="signup.jsp" class="btn btn-primary">See More</a>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="single_feature">
                                <h3 style="font-size: 28px;">Stay tuned</h3>
                                <h5 class="subtitle" style="font-size: 18px;font-family: arial;">Get latest notifications about the texts you have been sent and your questions answered.</h5>
                                <br><p style="font-size:15px;">Get to know what all happened while you were away and catch up by recieving notifications involving you. </p>

                                <a href="signup.jsp" class="btn btn-primary">See More</a>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="single_feature">
                                <h3 style="font-size: 28px;">Social Interaction</h3>
                                <h5 class="subtitle" style="font-size: 18px;font-family: arial;">Proper implementation of Chatting with users.</h5>
                                <br><p style="font-size:15px;">Continue your forum discussion and get answers in detail from the user while clearing further doubts. </p>
								<br>
                                <a href="signup.jsp" class="btn btn-primary">See More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section id="portfolio" class="portfolio">
            <div class="container">
                <div class="row">
                    <div class="main_portfolio_area text-center">
                        <div class="head_title">
                            <h2 style="font-size: 30px;">Designed for humans</h2>
                            <p style="font-size:20px;"> <u>Knowledge</u> is having the Right Answer.<br>
							<u>Intelligence</u> is asking the Right Question.</p>
                        </div>

                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="main_portfolio_content">
                                <div class="single_portfolio">
                                    <img src="assets/images/pf1.jpg" alt="" />
                                    <a href="" class="btn btn-larg">Design win</a>
                                </div>
                                <div class="single_portfolio">
                                    <img src="assets/images/pf1.jpg" alt="" />
                                    <a href="" class="btn btn-larg">Design win</a>
                                </div>
                                <div class="single_portfolio">
                                    <img src="assets/images/pf1.jpg" alt="" />
                                    <a href="" class="btn btn-larg">Design win</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section id="service" class="service">
            <div class="container">
                <div class="row">
                    <div class="main_service_area sections">
                        <div class="col-sm-3">
                            <div class="single_service">
                                <div class="single_service_icon">
                                    <i class="lnr lnr-pencil"></i>
                                </div>
                                <h3 style="font-size:25px;"><span>01</span> Design</h3>
                                <p style="font-size:16px;">It has been designed to fully make the platform as friendly as possible for the students
								of the institution.</p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="single_service">
                                <div class="single_service_icon">
                                    <i class="lnr lnr-location"></i>
                                </div>
                                <h3 style="font-size:25px;"><span>02</span> Refinement</h3>
                                <p style="font-size:16px;">Come up all fresh to gain and share knowledge through this platform. Better understand the world
								 and share your powerful imagination through various modules.</p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="single_service">
                                <div class="single_service_icon">
                                    <i class="icon icon-brush"></i>
                                </div>
                                <h3 style="font-size:25px;"><span>03</span> Dive In</h3>
                                <p style="font-size:16px;">Jump into the pool of various questions, go through sample and previous year examination 
								papers, view all the latest exam updates.</p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="single_service">
                                <div class="single_service_icon">
                                    <i class="icon icon-search4"></i>
                                </div>
                                <h3 style="font-size:25px;"><span>04</span> Research</h3>
                                <p style="font-size:16px;">Go deep into your imagination and find out the new possible solutions 
								of the problems and discuss and share with others. Sharing knowledge is the best way 
								to gain more knowledge..</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <section id="news"  class="news">

            <div class="row">
                <div class="top_new_one_left">
                    <div class="col-sm-12 no-padding">
                        <div class="single_new_top_one">
                            <h3><i class="lnr lnr-cloud-download"></i> Connectivity</h3>
                            <h5 class="subtitle" style="font-size:16px;">Stay connected with the latest users, latest queries and solutions. </h5>
                            <p style="font-size:15px;">Kick start your day with latest updates in your field, view it, analyze it, access it and share with others.
							Make the best use of your knowledge by sharing it.
							Catch up with other users and continue the discussion. Get notified while away to catch up where you left.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-7 no-padding">
                    <div class="top_news_right_img">
                        <img src="assets/images/new1.jpg" alt="" />
                    </div>
                </div>
            </div>

            <div class="new_two_area">
                <div class="single_new_two">
                    <div class="row">
                        <div class="col-sm-5 no-padding">
                            <div class="singel_two_left_vedio">
                                <a href=""><i class="fa fa-play"></i><img src="" alt="" /></a>
                            </div>
                        </div>

                        <div class="col-sm-7 no-padding">
                            <div class="single_two_right_content">
                                <div class="new_data"></div>
                                <p>The True Sign of Intelligence is not knowledge but imagination.</p>

                                <div class="new_author">
                                    <a href="">- Albert Einstein</a>
                                </div><br>
								<p>The Measure of intelligence is the ability to change.</p>

                                <div class="new_author">
                                    <a href="">- Albert Einstein</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="news_three_area">
                <div class="row">
                    <div class="col-sm-5 col-xs-12 no-padding">
                        <div class="single_new_three_left">
                            <h6></h6>
                            <p style="font-size:15px;">Password recovery can be done if you have forgotten your password. It takes only one step to 
                                  recover it. Just enter your username and emailId you entered at the time of registration and
								   you will get the mail containing your password.</p>

                            <div class="new_three_comments">
                                <a href="">5</a>
                                <a href="" class="coments" style="font-size:15px;">Comments</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-7 col-xs-12 no-padding">
                        <div class="single_new_three_right">
                            <img src="assets/images/index2.png" alt="" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="news_four_area">
                <div class="row">
                    <div class="col-sm-5 no-padding">
                        <div class="single_news_four_area">
                            <div class="single_news_four">
                                <p>"Gaining Knowledge is the first step to wisdom.
									 Sharing Kit, is the first step to humanity."</p>
                                <div class="new_author">
                                    <a href="">- Unknown</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>





        <footer id="footer" class="footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-12 col-sm-12">
                        <div class="copyright_text text-center">
                            <p class=" wow fadeInRight" data-wow-duration="1s">Developed by Haital Sharma, Intern at <a href="http://osoftmediia.com" target="_blank">OSoftMediia.com</a> @2018. All Rights Reserved</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- START SCROLL TO TOP  -->

        <div class="scrollup">
            <a href="#"><i class="fa fa-chevron-up"></i></a>
        </div>

        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>
        <script src="assets/js/vendor/isotope.min.js"></script>

        <script src="assets/js/jquery.easypiechart.min.js"></script>
        <script src="assets/js/jquery.mixitup.min.js"></script>
        <script src="assets/js/jquery.easing.1.3.js"></script>
        <script src="assets/js/jquery.slicknav.min.js"></script>


        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>
