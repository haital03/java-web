<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Contact Us</title>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!--For Plugins external css -->
        <link rel="stylesheet" href="assets/css/plugins.css" />

        <!--Theme custom css  -->
        <link rel="stylesheet" href="assets/css/style.css"> 
        <style>  
            body {
              font-family: Arial, Helvetica, sans-serif;
            }

            * {
                box-sizing: border-box;
            }

            /* Style inputs */
            .contactContent input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                margin-top: 6px;
                margin-bottom: 16px;
                resize: vertical;
            }

            .contactContent input[type=submit] {
                background-color: #4CAF50;
                width: 100%;
                color: white;
                padding: 12px 20px;
                border: none;
                cursor: pointer;
            }

            .contactContent input[type=submit]:hover {
                background-color: #45a049;
            }

            /* Style the container/contact section */
            .contactcontainer {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 10px;
            }

            /* Create two columns that float next to eachother */
            .contactcolumn {
                float: left;
                width: 50%;
                margin-top: 6px;
                padding: 20px;
            }

            /* Clear floats after the columns */
            .contactrow:after {
                content: "";
                display: table;
                clear: both;
            }
            ::-webkit-input-placeholder { /* Chrome */
                 color: red;
            }
            ::placeholder{color: red;}
            
            @media screen and (max-width: 600px) {
                .contactcolumn, input[type=submit] {
                    width: 100%;
                    margin-top: 0;
                }
            }
            .contactContent
            {
                margin-left: 210px;
                margin-top: 80px;
                padding-top: 30px;
                background-image: url("assets/images/contactImg_2.jpg");
                height: 100%;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center; 
            }
        </style>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    
    <body data-spy="scroll" data-target="#navmenu">
        <%@include file="loginheader.jsp"%>
        <%
            String username = (String)session.getAttribute("username");
            if (username == null) 
            {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="contactContent">

        <div class="contactContainer">
          
          <div class="w3-container w3-center w3-animate-zoom" style="text-align: center;">
            <h2 style="font-family: Comic Sans MS, Serif;color: white;font-size: 35px;"><b>Contact Us</b></h2>
            <p style="color: white;">Swing by for a cup of coffee, or leave us a message:</p>
          </div>
          <div class="contactrow">
            <div class="contactcolumn">
                <div id="map" style="width:100%;height:500px">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d109066.42047339378!2d75.50337865053851!3d31.32237873853345!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391a5a5747a9eb91%3A0xc74b34c05aa5b4b8!2sJalandhar%2C+Punjab!5e0!3m2!1sen!2sin!4v1526540336897" width="560" height="480" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
            </div>
              
            <div class="contactcolumn">
              <form method="post" action="contact.do" class="w3-container w3-center w3-animate-right">
                <label for="name" style="color: white;">Name</label>
                <input type="text" id="fname" name="txtName" placeholder="Your name..">
                <label for="email" style="color: white;">Email</label>
                <input type="text" id="lname" name="txtEmail" placeholder="Your email..">
                
                <textarea id="subject" name="txtSubject" placeholder="Write something.." style="height:170px"></textarea>
                <input type="submit" value="Submit">
              </form>
            </div>
          </div>
        </div>

        <script>
        // Initialize google maps
        function myMap() {
          var myCenter = new google.maps.LatLng(51.508742,-0.120850);
          var mapCanvas = document.getElementById("map");
          var mapOptions = {center: myCenter, zoom: 12};
          var map = new google.maps.Map(mapCanvas, mapOptions);
          var marker = new google.maps.Marker({position:myCenter});
          marker.setMap(map);
        }
        </script>

        
    </div>
       
    </body>
    <%@include file="footer.html"%>
</html>
