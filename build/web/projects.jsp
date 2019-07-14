<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Exam Updates</title>
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <style>
        .col1
            {
                height: auto;
                width: 70%;
                margin-right: 30px;
            }
            .col2
            {
                padding:12px; 
            }
            tr
            {
                border-bottom: 2px dashed #835FA9 ;
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
                height : 150px;
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
                object-fit: contain;
                object-position: 50% 50%;
                max-height: 100%;
                max-width: 100%;
            }
            /* The Close Button */
            .mySlides {display:none;}
            .examcontent{
                    width:70%;height: 500px;margin-top: 130px;margin-left: 320px;
                    background:white;border-radius: 20px;box-shadow: 8px 18px 18px 8px rgba(0,0,0,0.3);}
            .examform
            {
                margin-left: 390px;
                margin-top: 90px;
                margin-bottom: 20px;
                padding:30px;
                border-radius: 30px;
                width:62%;
                color:white;
                height: 300px;            
                border: 4px dashed #835FA9;
                background: #7f7f7f;
                box-shadow: 8px 18px 18px 8px rgba(0,0,0,0.3);
            }
            .examform input[type="text"],input[type="date"],input[type="submit"],input[type="reset"]
            {
                color:black;
            }
            #postexambtn
            {
                padding:12px;
                background-color: #835FA9;
                width:120px;
                color: white;
                border-radius: 20px;
            }
            .content1
            {
                width:64%;
                height: auto;
                margin-top: 28px;
                margin-left: 373px;
                background:white;
                border: 3px dashed grey;
                border-radius: 20px;
                padding:30px;
                box-shadow: inset 0 3px 4px #888;
                margin-bottom: 50px;
            }
    </style>
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
        <div class="examform">
           <form method="post" action="postProjects.jsp" enctype="multipart/form-data">
               <center><h2><b>UPLOAD PROJECT FILE</h2></center>
               Language Used : <input type="text" name="txtLangUsed" style="width:80%;" required/>
               <b><textarea rows="10" cols="100" placeholder="Enter Description..." style="color:black;margin-top: 10px;width:100%;height:100px;margin-bottom: 8px;" name="txtDesc"></textarea></b>
               <input type="reset" value="Reset" id="postexambtn" style="float: left;"/>  </b>
               
               <b><input type="submit" value="Post" id="postexambtn" style="float:right;" /></b>
               <div class="box" style="float:center;height:80px;padding-top:2px;margin-top: -3px;background: transparent;">
                <b> <input type="file" name="txtFile" id="file-2" class="inputfile inputfile-2" />
                    <label for="file-2" style="background: white;max-width:50%;margin-left: 160px;color: #835FA9;border-radius: 18px;"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="12" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choose a file&hellip;</span></label>
                </b></div>
               
           </form>
       </div>        
        <div class="content1">
            <table>
            <%
                try
                {
                    DBOperations dbObj = new DBOperations();
                    ResultSet rst = dbObj.getProjects();
                    while(rst.next())
                    {
                        long projectId = rst.getLong(1);
                        String projectFile = rst.getString(2);
                        String projectDesc = rst.getString(3);
                        String langUsed = rst.getString(4);
                        Timestamp creationTime = rst.getTimestamp(5);
                        long createdId = rst.getLong(6);
                        String createdBy = dbObj.getUsername(createdId);
                        %>
    <!-- Containing image and its description -->  
                <tr>
                    <td class="col1">
                        <%
                            out.print("<span style='color:grey;'><b> Language Used : </b>"+langUsed+"</span>");
                            out.println(", <b></b>"+projectDesc+"<br>");
                            
                        %>
                        <span style='color:grey;'><b>Posted By : </b><%=createdBy%><br></span>
                    </td>
                            <td class="col2">
                                <a href=" <%=projectFile%>" class="btn btn-info btn-lg" 
                                   style="background-color: peru;" download>
                                    <i class="fa fa-download"></i>&nbsp;Download File
                                </a>                                
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
        
        
    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
               x[i].style.display = "none";  
            }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}    
            x[myIndex-1].style.display = "block";  
        setTimeout(carousel, 2000); // Change image every 2 seconds
    }
    </script>
    <script src="assets/js/custom-file-input.js"></script>
    <%@include file="footer.html" %>
    </body>
</html>