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
        .col1
            {
                height: auto;
                width: 70%;
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
            .mySlides {display:none;}
            .examcontent{
                    width:70%;height: 500px;margin-top: 130px;margin-left: 320px;
                    background:white;border-radius: 20px;box-shadow: 8px 18px 18px 8px rgba(0,0,0,0.3);}
            .examform
            {
                margin-left: 390px;
                margin-top: 90px;
                margin-bottom: 30px;
                padding:30px;
                border-radius: 30px;
                width:62%;
                color:white;
                height: 350px;            
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
           <form method="post" action="postExamupdate.jsp" enctype="multipart/form-data">
                   <center><h2><b>POST EXAM UPDATE</h2></center>
               Enter Exam Name : <input type="text" name="txtExamName" placeholder="" required/>
               Tentative Date : <input type="date" name="txtExamDate" placeholder="Choose Exam Date" required/><br>
               Exam Link(if any) : <input type="text" name="txtExamLink" style="width:78%;color: black;margin-top: 10px;"/><br>
               
               <b><textarea rows="10" cols="100" placeholder="Enter Description..." style="color:black;margin-top: 10px;width:100%;height:100px;margin-bottom: 8px;" name="txtDesc"></textarea></b>
               
               <input type="reset" value="Reset" id="postexambtn" style="float: left;"/>  </b>
               
               <b><input type="submit" value="Post" id="postexambtn" style="float:right;" /></b>
               <div class="box" style="float:center;height:80px;padding-top:2px;margin-top: -3px;background: transparent;">
                <b> <input type="file" name="txtFile" id="file-2" class="inputfile inputfile-2" />
                    <label for="file-2" style="background: white;max-width:50%;margin-left: 160px;color: #835FA9;border-radius: 18px;"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="12" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choose a file&hellip;</span></label>
                </b></div>
           </form>
       </div>
       <div style="border-radius:48px;box-shadow: 8px 18px 18px 8px rgba(0,0,0,0.3);border: 2px dashed grey;object-fit: cover; align-items: center;padding-top: 10px;margin-top:10px;margin-left: 420px;width:800px;height:350px;margin-bottom:20px;background: #4c4c4c;">
          <div class="w3-content w3-section" style="max-width:500px; margin-top: 330px;">
            <a href="https://www.careerpower.in/ibps-po.html" target="_blank"><img class="mySlides" src="image/1T.png" style="width:100%;"></a>
            <a href="http://web.gndu.ac.in/placement-recruiters.aspx" target="_blank"><img class="mySlides" src="image/2T.png" style="width:100%;"></a>
            <a href="https://www.careerpower.in/ssc-cgl-coaching.html" target="_blank"><img class="mySlides" src="image/3T.png" style="width:100%;"></a>
            <a href="https://www.sarvgyan.com/articles/gate-2019" target="_blank"><img class="mySlides" src="image/4T.png" style="width:100%;"></a>
            <a href="https://www.careerpower.in/ibps-po.html" target="_blank"><img class="mySlides" src="image/5T.png" style="width:100%;"></a>
            <a href="https://www.careerpower.in/sbi-po-coaching.html" target="_blank"><img class="mySlides" src="image/6T.png" style="width:100%;"></a>
          </div>
       </div>
        
        <div class="content1">
            <table>
            <%
                try
                {
                    DBOperations dbObj = new DBOperations();
                    ResultSet rst = dbObj.getExamUpdates();
                    while(rst.next())
                    {
                        long examId = rst.getLong(1);
                        String examName = rst.getString(2);
                        java.util.Date examDate = rst.getDate(3);
                        String examDesc = rst.getString(4);
                        String examFile = rst.getString(5);
                        Timestamp creationTime = rst.getTimestamp(6);
                        long createdUserId = rst.getLong(7);
                        String examLink = rst.getString(8);
                        String createdBy = dbObj.getUsername(createdUserId);
                        %>
    <!-- Containing image and its description -->  
                <tr>
                    <td class="col1">
                        <%
                            out.println("<h3><b>"+examName+"<br></h3></b>");
                            out.print("<span style='color:grey;'>[Posted By : "+createdBy+" , "+creationTime+"]</span>");
                            out.println("<br><br><b>Tentative Date : "+examDate+"<br>Reference : </b>"+examDesc+
                                    "<br>");
                            if(examLink != null){
                        %>
                                <b><a href="<%=examLink%>" target="_blank" style="color: blue;">Click here to know more</a></b>
                        <%}%>
                    </td>
                            <td class="col2">
                                <%
                                    if(examFile.endsWith(".pdf") || examFile.endsWith(".docx") || examFile.endsWith(".java"))
                                    {
                                        System.out.println("pdf embed : "+examFile);
                                %>
                                <div id="showfile">
                                <a href=" <%=examFile%>" target="_blank">
                                    <embed src ="<%=examFile%>" id="myfileindiv" onclick="myFunction1(this)" style="object-fit: contain;"/>
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
                                    <img src="<%=examFile%>" id="myfileindiv" onclick="myFunction2(this)"  style="object-fit: contain;"/>
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