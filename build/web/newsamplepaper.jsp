<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Sample Paper page</title>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!--For Plugins external css -->
        <link rel="stylesheet" href="assets/css/plugins.css" />
        <!--Theme custom css  -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" type="text/css" href="assets/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/component.css" />

        <!--Theme Responsive css -->
        <link rel="stylesheet" href="assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
                <script>
            
            function myFunction1(divId)
            {
                alert("in there.");
                document.getElementById("file01").src = divId.src;
                document.getElementById("modalfile").style.display = "block";
                var modal = document.getElementById('modalfile');
                window.onclick = function(divId) 
                {
                    if (divId.target === modal) 
                    {
                        modal.style.display = "none";
                    }
                };
                var span = document.getElementsByClassName("close")[0];
                span.onclick = function() 
                { 
                    modal.style.display = "none";
                }; 
            }
            function myFunction2(divId)
            {
                document.getElementById("img01").src = divId.src;
                document.getElementById("modalimg").style.display = "block";
                var modal = document.getElementById('modalimg');
                window.onclick = function(divId) 
                {
                    if (divId.target === modal) 
                    {
                        modal.style.display = "none";
                    }
                };
                var span = document.getElementsByClassName("close")[0];
                span.onclick = function() 
                { 
                    modal.style.display = "none";
                };
            }
            </script>
            <style>
            .content1
            {
                width:70%;
                height: auto;
                margin-top: 28px;
                margin-left: 340px;
                background:white;
                border: 3px dashed grey;
                border-radius: 20px;
                padding:30px;
                box-shadow: inset 0 3px 4px #888;
                margin-bottom: 50px;
            }
            .agile-its
            {
                width:70%;
                height: 360px;
                margin-top: 130px;
                margin-left: 340px;
                background:white;
                border-radius: 20px;
                border: 3px dashed #835FA9;
                box-shadow: 8px 18px 18px 8px rgba(0,0,0,0.3);
            }
            .col1
            {
                height: auto;
                width: 60%;
                margin-right: 20px;
            }
            .col2
            {
                padding:12px;    
            }
            tr
            {
                border-bottom: 2px dashed #835FA9 ;
            }
            .modal 
            {
                margin-top: 50px;
                margin-left: 0px;
                margin-right: 0px;
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 80px;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.9);
            }
            .modal-content, #caption 
            {    
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            @-webkit-keyframes zoom {
                from {-webkit-transform: scale(0)} 
                to {-webkit-transform: scale(1)}
            }

            @keyframes zoom {
                from {transform: scale(0.1)} 
                to {transform: scale(1)}
            }
            #showfile
            {
                right: 0;
                width:50%;
                height : 200px;
                border:3px solid black;
                align-content: center;
                cursor: pointer;
            }
            #showfile:hover
            {
                opacity:0.6;
            }
            #myfileindiv
            {
                object-position: 50% 50%;
                max-height: 100%;
                max-width: 100%;
            }
            .w3layouts
            {
                padding:50px;
            }
            .w3layouts p
            {
                font-size:14px;
                line-height:27px;
                color:#000;
                margin-bottom:10px;
            }
            .agileinfo
            {
                position:relative;
            }
            #postpaperbtn
            {
                background-color: #835FA9 ;
                border-radius: 15px;
                color: white;
                margin-top: 0px;
                width:200px;
                height: 50px;
            }
            .postpaperbtn:hover
            {
                background-color: lightgray;
            }
            #fileselect
            {
                position: absolute;
                top: 0px;
                left: 23%;
                padding: 8px 5px;
                opacity: 0;
                cursor: pointer;
            }
            #filedrag,.desc
            {
                display: none;
                font-weight: 600;
                text-align: center;
                padding: 25px 0;
                margin: 25px 0;
                color: #f3c500;
                border: 2px dashed #f3c500;
                border-radius: 0px;
                -webkit-border-radius: 0px;
                -moz-border-radius: 0px;
                -ms-border-radius: 0px;
                -o-border-radius: 0px;
                cursor: default;
                font-size: 20px;
            }
            #filedrag.hover
            {
                color: #f00;
                border-color: #f00;
                border-style: solid;
                box-shadow: inset 0 3px 4px #888;
            }
            .desc
            {
                width: 100%;
                padding: 15px 10px;
                margin: 15px 0;
                border: 1px solid #835FA9;
                color: #555;
                font-size: 14px;
                font-weight:700;
            }
            .choose
            {
                width: 54%;
                background-color: #835FA9;
                text-align: center;
                border: none;
                padding: 10px 0;
                color: #fff;
                font-size:14px;
                cursor:pointer;
                margin-left:23%;
            }
            /* The Close Button */
            .close {
                position: absolute;
                top: 30px;
                right: 5px;
                color: red;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
                border : 5px solid red;
            }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
                border : 5px solid red;
            }

            /* 100% Image Width on Smaller Screens */
            @media only screen and (max-width: 700px){
                .modal-content {
                    width: 100%;
                }
            }
            @media screen and (max-width: 1440px) {
                    input[type="file"] {
                            left: 20%;
                    }
                    input[type="submit"] {
                            width: 60%;
                            margin-left: 20%;
                    }
            }
            @media screen and (max-width: 1366px) {
                    input[type="file"] {
                            left: 18%;
                    }
                    input[type="submit"] {
                            width: 64%;
                            margin-left: 18%;
                    }
            }
            @media screen and (max-width: 1280px) {
                    input[type="file"] {
                            left: 15%;
                    }
                    input[type="submit"] {
                            width: 70%;
                            margin-left: 15%;
                    }
            }
            @media screen and (max-width: 1080px) {
                    input[type="file"] {
                            left: 10%;
                            top: 0px;
                            padding: 7px 0px;
                    }
                    input[type="submit"] {
                            width: 80%;
                            margin-left: 10%;
                    }
                    .w3layouts {
                            padding: 37px;
                    }
            }
            @media screen and (max-width: 1024px) {
                    .agile-its {
                            width: 37%;
                    }
                    input[type="file"] {
                            left: 10%;
                    }
                    input[type="submit"] {
                            width: 80%;
                            margin-left: 10%;
                    }
            }
            @media screen and (max-width: 991px) {
                    .agile-its {
                            width: 39%;
                    }
                    input[type="file"] {
                            left: 11%;
                    }
                    input[type="submit"] {
                            width: 78%;
                            margin-left: 11%;
                    }
            }
            @media screen and (max-width: 966px) {
                    input[type="file"] {
                            left: 10%;
                    }
                    input[type="submit"] {
                            width: 80%;
                            margin-left: 10%;
                    }
            }
            @media screen and (max-width: 900px) {
                    .agile-its {
                            width: 44%;
                    }
                    input[type="file"] {
                            left: 12%;
                    }
                    input[type="submit"] {
                            width: 76%;
                            margin-left: 12%;
                    }
            }
            @media screen and (max-width: 800px) {
                    h1 {
                            font-size: 40px;
                    }
                    .agile-its {
                            width: 48%;
                    }
                    input[type="file"] {
                            left: 10.5%;
                    }
                    input[type="submit"] {
                            width: 79%;
                            margin-left: 10.5%;
                    }
            }
            @media screen and (max-width: 768px) {
                    .w3layouts p {
                            font-size: 13.3px;
                    }
                    input[type="file"] {
                            left: 8.5%;
                    }
                    input[type="submit"] {
                            width: 83%;
                            margin-left: 8.5%;
                    }
            }
            @media screen and (max-width: 736px) {
                    .w3layouts {
                            padding: 30px;
                    }
            }
            @media screen and (max-width: 667px) {
                    .agile-its {
                            width: 53%;
                    }
                    input[type="file"] {
                            left: 8%;
                    }
                    input[type="submit"] {
                            width: 84%;
                            margin-left: 8%;
                    }
            }
            @media screen and (max-width: 640px) {
                    .agile-its {
                            width: 58%;
                    }
                    input[type="file"] {
                            left: 10.5%;
                    }
                    input[type="submit"] {
                            width: 79%;
                            margin-left: 10.5%;
                    }
            }
            @media screen and (max-width: 600px) {
                    h1 {
                            font-size: 37px;
                    }
                    .agile-its {
                            width: 61%;
                    }
                    input[type="file"] {
                            left: 9.5%;
                    }
                    input[type="submit"] {
                            width: 81%;
                            margin-left: 9.5%;
                    }
            }
            @media screen and (max-width: 568px) {
                    .agile-its {
                            width: 65%;
                            margin: 40px auto;
                    }
                    input[type="file"] {
                            left: 10%;
                    }
                    input[type="submit"] {
                            width: 80%;
                            margin-left: 10%;
                    }
            }
            @media screen and (max-width: 480px) {
                    .agile-its {
                            width: 76%;
                    }
                    .footer p {
                            width: 90%;
                            margin: 0 auto 20px auto;
                    }
                    input[type="file"] {
                            left: 9%;
                    }
                    input[type="submit"] {
                            width: 82%;
                            margin-left: 9%;
                    }
            }
            @media screen and (max-width: 414px) {
                    h1 {
                            font-size: 33px;
                    }
                    .agile-its {
                            width: 84%;
                    }
                    .w3layouts {
                            padding: 25px;
                    }
                    input[type="file"] {
                            left: 8%;
                    }
                    input[type="submit"] {
                            width: 84%;
                            margin-left: 8%;
                    }
                    .footer p {
                            font-size:13px;
                    }
            }
            @media screen and (max-width: 384px) {
                    h1 {
                            font-size: 30px;
                    }
                    .agile-its {
                            width: 86%;
                    }
                    .w3layouts {
                            padding: 22px;
                    }
                    .w3layouts p {
                            font-size: 13px;
                    }
                    input[type="file"] {
                            left: 6%;
                    }
                    input[type="submit"] {
                            width: 88%;
                            margin-left: 6%;
                    }

            }
            @media screen and (max-width: 375px) {
                    input[type="file"] {
                            left: 5%;
                    }
                    input[type="submit"] {
                            width: 90%;
                            margin-left: 5%;
                    }
            }
            @media screen and (max-width: 320px) {
                    h1 {
                            font-size: 28px;
                            margin-top:30px;
                    }
                    h2{
                            font-size:17px;
                    }
                    .w3layouts {
                            padding: 15px;
                    }
                    input[type="file"] {
                            left: -1%;
                    }
                    input[type="submit"] {
                            width: 102%;
                            margin-left: 0%;
                    }
                    #filedrag {
                            font-size:16px;
                            padding:16px 0px;
                    }
                    #messages {
                            padding: 8px 10px;
                    }
                    .w3layouts p {
                            font-size: 12px;
                    }           
            }
            </style>            
        
    </head>    
    <body data-spy="scroll" data-target="#navmenu">
        <%@include file="loginheader.jsp" %>
        <%
            String username = (String)session.getAttribute("username");
            if (username == null) 
            {
                response.sendRedirect("index.jsp");
            }
        %>
           
        <%!
            String desc = null;
            String paperFile = null;
            Timestamp creationTime = null;  
            String createdBy = null;
            long paperId = 0;
        %>

        <div class="agile-its" style="margin-top: 90px;border: none;padding:20px;border: 3px dashed #835FA9;background: #7f7f7f;color:white">
          
                <center><h2>Upload Sample Paper</h2><br></center>
            <form id="upload" action="postsamplepaper.jsp" method="post" enctype="multipart/form-data">
                    <center>
                    <div class="box" style="height:80px;padding-top:2px;margin-top: 5px;background: transparent;">
                    <input type="file" name="txtFile" id="file-2" class="inputfile inputfile-2" />
                    <label for="file-2" style="background: white;width:100%;margin-left: 50px;color: #835FA9;border-radius: 18px;"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="12" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choose a file&hellip;</span></label>

                     </div> 
                    </center>
                <div id="desc" style="margin-top:-20px;">
                    
                       <!-- <center><p>( Enter description )</p></center>-->
                    <b><textarea rows="10" cols="100" placeholder="Enter Description..." style="width:100%;height:100px;margin-bottom: 8px;color:black;" name="txtDesc"></textarea>
                    </b>
                    <input type="reset" value="Reset" id="postpaperbtn" style="float: left;"/>     
                    <input type="submit" value="Post" id="postpaperbtn" style="float:right;" /> 

                </div>
           </form>
        </div> 
        <div class="content1">
            <table>
            <%
                try
                {
                    DBOperations dbObj = new DBOperations();
                    ResultSet rst = dbObj.getSamplePapers();
                    while(rst.next())
                    {
                        paperId = rst.getLong(1);
                        desc = rst.getString(2);
                        paperFile = rst.getString(3);
                        creationTime = rst.getTimestamp(4);
                        long createdUserId = rst.getLong(5);
                        createdBy = dbObj.getUsername(createdUserId);
                        %>
    <!-- Containing image and its description -->  
                        <tr>
                            <td class="col1">
                                <%
                                    out.println("<h3>"+desc+"<br></h3>");
                                    out.println("<b>[ Posted By : "+createdBy+" , "+creationTime+" ]</b>");
                                    out.print("<h5><a href='"+paperFile+"' target='_blank'><u>View File In New Tab</u></a></h5>");
                                %>
                            </td>
                            <td class="col2">
                                <%
                                    if(paperFile.endsWith(".pdf") || paperFile.endsWith(".docx"))
                                    {
                                        System.out.println("pdf embed : "+paperFile);
                                %>
                                <div id="showfile">
                                <a href=" <%=paperFile%>" target="_blank">
                                    <embed src ="<%=paperFile%>" id="myfileindiv" onclick="myFunction1(this)" style="object-fit: cover;"/>
                                </a>
                                </div>
                                    <!-- The Modal -->
                                    <center>
                                        <div id="modalfile" class="modal">
                                        <span class="close" style="color:white;">&times;</span>
                                        <embed class="modal-content" id="file01" alt="Sample paper">
                                        <div id="caption"></div>
                                        </div>
                                    </center>
                                <% 
                                    }
                                    else
                                    {
                                %>
                                    <div id="showfile">
                                    <img src="<%=paperFile%>" id="myfileindiv" onclick="myFunction2(this)" style="object-fit: cover;"/>
                                    </div>
                                    <center>
                                        <div id="modalimg" class="modal">
                                        <span class="close" style="color:white">&times;</span>
                                        <img class="modal-content" id="img01" alt="Sample Paper">
                                        <div id="caption"></div>
                                        </div>
                                    </center>
                                <%
                                    }
                                %>
                            </td>
                        </tr>
                        <%
                    }                    
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            %>
            </table>
        </div>
            <%@include file="footer.html" %>
            <script src="assets/js/custom-file-input.js"></script>
    </body>
</html>
