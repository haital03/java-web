<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="mydatabase.DBOperations"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Think Bits</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="assets/css/slicknav.min.css">
        <link rel="stylesheet" href="assets/css/fonticons.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <link rel="stylesheet" href="assets/fontcss/style.css"> 
        
        <link rel="stylesheet" href="assets/fonts/stylesheet.css">
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
            function myFunction(divId)
            {
                var x = document.getElementById(divId);
                if (x.style.display === "none")
                {
                    x.style.display = "block";
                } 
                else
                {
                    x.style.display = "none";
                }
            }
           
        </script>
        <style>
            .formcont
            { 
                background-color: white;
                margin-left:320px;
                border: 5px double #666666;
                width:65%;
                border-radius: 10px 10px;
            }
            .postcontainer
            {
                padding: 10px;
            }
            .questbl
            {
                padding:10px;
            }
            textarea
            {
                width: 100%;
                background-color: white;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }       
            .filebtn
            {
                padding:5px;
                width:350px;
                margin-right: 25px;
                background-color: lightgray;
                float:left;
            }
               
            .answerbtn
            {
                background-color: #ddd1e7;
                border: 2px solid #835FA9;
                font-size: 16px;
                border-radius: 10px;
                transition:.800ms;
                font-weight: bold;
                padding: 7px;
                padding: 6px;
                width: auto;
                color: black;
                top:0;
                cursor: pointer;
                margin-right: 20px;
            }
            .submitanswerbtn
            {
                background-color: white;
                border: 2px solid #835FA9;
                font-size: 16px;
                margin-left: 10px;
                border-radius: 10px;
                transition:.800ms;
                font-weight: bold;
                padding: 7px;
                padding: 6px;
                width: auto;
                color: #835FA9;
                float: right;
                top:0;
                cursor: pointer;
                margin-right: 20px;
            }
            .commentbtn
            {                
                background-color: white;
                border: none;
            }
            .commenthref
            {
                background-color: white;
                border: 1px solid black;
                border-radius: 10px;
                padding: 7px;
                width: auto;
                color: black;
                cursor: pointer;
            }
            .postbtn
            {
                background-color: #835FA9;
                border: 2px solid whitesmoke;
                border-radius: 18px;
                margin-left: 10px;
                transition:.800ms;
                color: whitesmoke;
                font-size: 22px;
                font-weight: bold;
                padding-left: 18px;
                padding-right: 18px;
                padding-top: 7px;
                padding-bottom: 12px;
                margin-right: 20px;
                cursor: pointer;
                float:right;
            }
            .postbtn:hover
            {
                background-color: graytext;
                color: white;
            }
            button:hover 
            {
                opacity: 0.8;
            }
            a.hsbtn:hover
            {
                -ms-transform: scale(1.1); /* IE 9 */
                -webkit-transform: scale(1.1); /* Safari 3-8 */
                transform: scale(1.1);
                font-weight: bold;
            }
        </style>
        <script type="text/javascript">
        function functionAlert()
        {
        <%
            DBOperations dbObj = new DBOperations();
            if (session.getAttribute("answerSubmitted") != null) 
            {
        %>
                alert("Answer Submitted!");
        <%
                session.removeAttribute("answerSubmitted");
            }

           if(!dbObj.verifySessionUser((String)session.getAttribute("sessionUsername"),(String)session.getAttribute("sessionPassword")))
            {
                 %>alert("Login Successful!!");<%
           }
            session.removeAttribute("sessionUsername");
            session.removeAttribute("sessionPassword"); 

        %>                          
        }
        function showResult(str) 
        {
          if (str.length===0) 
          {
            document.getElementById("livesearch").innerHTML="";
            document.getElementById("livesearch").style.border="0px";
            return;
          }
          if (window.XMLHttpRequest) 
          {
            xmlhttp=new XMLHttpRequest();
          } 
          else 
          {  // code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
          }
          xmlhttp.onreadystatechange=function() 
          {
            if (this.readyState===4 && this.status===200) 
            {
              document.getElementById("livesearch").innerHTML=this.responseText;
              document.getElementById("livesearch").style.border="1px solid #A5ACB2";
            }
          };
          xmlhttp.open("GET","livesearch.jsp?q="+str,true);
          xmlhttp.send();
        }
    </script>
    </head>

    
    <body data-spy="scroll" data-target="#navmenu" style="background-color:white;" onload="functionAlert();">
        <%
            String usernameServices = (String)session.getAttribute("users_name");
            if (usernameServices == null) 
            {
                response.sendRedirect("index.jsp");
            }
        %>    

        <div class='preloader'><div class='loaded'>&nbsp;</div></div>
        <%@include file="loginheader.jsp" %>
        <div style="background-color: #ecd2fc;padding-top: 110px;">
    <!-- Question form -->         
            <form class="formcont" style="height:260px;" name="questionForm" method="post" action="postQuestion.jsp" enctype="multipart/form-data">
                <div class="postcontainer" style="background:#7f7f7f;color:white;max-height:100%;"> 
                    <h4>Post your query, <%=usernameServices%> : </h4>
                    <textarea rows="30" cols="100" placeholder="Question..." style="color:black;height:125px;border: 2px solid purple;border-radius: 9px;" name="txtPostQuery" required>
                    </textarea>  
                    <button class="postbtn" type="submit" name="btnpost">Post Query</button>
                    <div class="box" style="padding-top:2px;margin: 0px;background: transparent;">
			<input type="file" name="txtFile" id="file-2" class="inputfile inputfile-2" />
			<label for="file-2" style="background:white;color: #835FA9;border-radius: 18px;"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="12" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choose a file&hellip;</span></label>
                    </div>
                </div>
            </form><br> 
            <%!
                long quesId;
                String ques = null;
                String quesFile = null;
                Timestamp creationTime = null;
                long userId = 0;
                String username = null;
                String ans = null;
                long ansId = 0;
                String ansFile = null;
                Timestamp ansCreationTime = null;
                long ansUserId = 0;
                String ansUsername = null;
                long commentId = 0;
                String comment = null;
                long commentUserId = 0;
                String commentUser = null;
                int totalComments = 0;
                int upvotes = 0, downvotes = 0;
            %>
            <div class="formcont" style="padding:10px;">
                <table class="questbl">
                    <%
                        try 
                        {
                            //retrieving questions
                            
                            ResultSet rst = dbObj.getQuestions();
                            while (rst.next()) 
                            {
                                quesId = rst.getLong(1);
                                ques = rst.getString(2);
                                quesFile = rst.getString(3);
                                creationTime = rst.getTimestamp(4);
                                userId = rst.getLong(5);
                                username = dbObj.getUsername(userId);
                    %>

    <!-- First Row containing question --> 
                <div id="<%=quesId%>">
                    <tr>    
                    <h3 style="color: black;"><b><u>Question :</u>   
                                <%                                
                                    out.print(" " + ques);
                                    out.print("</h3><span style=color:gray>[ Posted By : " + username + ", On " + creationTime + " ]    </span>");
                                %>

    <!-- Answer  form ---->
    
                            &nbsp;&nbsp;&nbsp;
                            <button onclick="myFunction('answer<%=quesId%>')" class="answerbtn">&#9997;&nbsp;Answer</button><br>
                            <div id="answer<%=quesId%>" style="display:none;">
                                <form method="post" action="postAnswer.jsp" name="answerForm" enctype="multipart/form-data" >
                                    <textarea rows="10" cols="100" placeholder="Post your Answer..." style="height:100px;border: 2px solid gray;border-radius: 7px;" name="txtPostAnswer"></textarea>
                                    <button class="submitanswerbtn" type="submit" name="btnpost">Submit Answer</button>
                                    <div class="box" style="padding-top:2px;margin: 0px;background: transparent;height:40px;">
                                        <input type="file" name="txtFile" id="file-2" class="inputfile inputfile-2" />
                                        <label for="file-2" style="color: #835FA9;border-radius: 10px;height:40px;padding: 7px;"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="12" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choose a file&hellip;</span></label>
                                    </div>
                                    
                                    <input type="text" style="display:none;width:0px;" name="txtQuesId" value="<%=quesId%>"/>
                                    
                                </form>
                            </div>
                        </b>
                        <br>    
                        </tr>
                    </div>
    <!---- Image / file related to the question  ---->
   
                        <tr>   
                            <%
                                if (quesFile != null) 
                                {
                                    if (!quesFile.replace("questionimages", "").equals("")) {
                                        //out.println("quesFile: " + quesFile);
                                        out.print("\t<center>");
                                        if (quesFile.endsWith(".jpg") || quesFile.endsWith(".png") || quesFile.endsWith(".jpeg")) {
                            %>
                        <img src="<%=quesFile%>" width="700px" height="500px" style="object-fit: contain;border:2px solid #835FA9; align-content: center;"/>
                        <%
                        } else if (quesFile.endsWith(".docx") || quesFile.endsWith(".pdf") || quesFile.endsWith(".doc") || quesFile.endsWith(".java")) {
                        %>                                       
                        <embed src="<%=quesFile%>" width="700px" height="500px" style="object-fit: contain;border:2px solid #835FA9;align-content: center;"/>
                    </center></tr><hr>
                        <%
                                    }
                                }
                            }
    //retrieving answer

                            ResultSet rst1 = dbObj.getAnswers(quesId);
                            while (rst1.next()) 
                            {
                                ansId = rst1.getLong(1);
                                ans = rst1.getString(2);
                                ansFile = rst1.getString(3);
                                ansCreationTime = rst1.getTimestamp(4);
                                ansUserId = rst1.getLong(5);
                                int votes = rst1.getInt(6);
                                ansUsername = dbObj.getUsername(ansUserId);
                        %>
                        <tr>   
                            
    <!--First Row containing answer -->
                        &nbsp;&nbsp;&nbsp;
                        <h4 style="color:black;"><b><u>Answer :</u>   
                                <%
                                    out.print(" " + ans);
                                    out.print("</h4><span style=color:gray> [ Answered By : " + ansUsername + " ," + ansCreationTime + " ]   </span>");
                                    upvotes = dbObj.getUpvotes(ansId);
                                    downvotes = dbObj.getDownvotes(ansId);
                                %>

    <!--Comment form && up-vote and down-vote buttons -->

                            &nbsp;&nbsp;&nbsp;
                            <button onclick="myFunction('comment<%=ansId%>')" class="commenthref"><i class="fa fa-comment" style="font-size: 18px;"></i>&nbsp;Comment</button>&nbsp;&nbsp;
                            <a href="vote.jsp?ansId=<%=ansId%>&&voteType=upvote" class="commenthref"><i class="fa fa-thumbs-o-up" style="font-size:24px;color: blue;"></i><button id="upvoteId" class="commentbtn">Upvote&nbsp;&nbsp;<%=upvotes%></button></a>&nbsp;&nbsp;
                            <a href="vote.jsp?ansId=<%=ansId%>&&voteType=downvote" class="commenthref"><i class="fa fa-thumbs-o-down" style="font-size:24px;"></i><button id="downvoteId" class="commentbtn">Downvote&nbsp;&nbsp;<%=downvotes%></button></a><br>

                            
                            <div id="comment<%=ansId%>" style="display:none;">
                                <form method="post" action="postComment.do" name="commentForm">
                                    <textarea rows="10" cols="100" placeholder="Comment..." style="height:45px;" name="txtPostComment"></textarea>
                                    <input type="text" style="display:none;width:0px;" name="txtCommentId" value="<%=ansId%>"/>                              
                                    <button type="submit" class="commenthref">Post Comment</button>
                                </form>
                            </div>

                            <br></tr>

                            
                                
    <!-- Second Row containing answer image / file ---->

                            <tr>    
                                <%
                                    if (ansFile != null) 
                                    {
                                        if (!ansFile.replace("answerimages", "").equals("")) {
                                            out.print("<center>");
                                            if (ansFile.endsWith(".jpg") || ansFile.endsWith(".png") || ansFile.endsWith(".jpeg") || ansFile.endsWith(".java") || ansFile.endsWith(".html") || ansFile.endsWith(".css") || ansFile.endsWith(".js")) {
                                %>
                                
                            <img src="<%=ansFile%>" width="700px" height="500px" style="object-fit: contain;border:2px solid #835FA9; margin:auto;"/>
                            <br>
                            <%
                            } else if (ansFile.endsWith(".docx") || ansFile.endsWith(".pdf") || ansFile.endsWith(".doc")) {
                            %>
                            
                            <embed src="<%=ansFile%>" width="700px" height="500px" style="object-fit: contain;border:2px solid #835FA9;margin:auto;"/>
                            </center></tr> <hr><br>
                            
                    <!-- <code></code> for displaying code -->
                            
                            <%

                                        }
                                    }
                                }
                                out.print("</tr>");
                                totalComments = dbObj.totalComments(ansId);
                            %>
                                <button onclick="myFunction('vote<%=ansId%>')" style="border:none;color:#835FA9;background-color: transparent;">View <%=totalComments%> comment(s)</button>                            
                                <div id="vote<%=ansId%>" style="display:none;border-radius: 5px;background-color: #eee8f3;">
                                    <%
    //retrieve all comments
                                ResultSet rst3 = dbObj.getComments(ansId);
                                
                                while (rst3.next()) 
                                {
                                        commentId = rst3.getLong(1);
                                        comment = rst3.getString(2);
                                        commentUserId = rst3.getLong(3);
                                        commentUser = dbObj.getUsername(commentUserId);
                            %>
    <b><h5 style="color:black;line-height: 18px;padding-bottom: 7px;margin-left: 10px;margin-top:15px;border-bottom: 0.3px solid purple;">
                            
                            <%                                      
    //view all comments
                                        out.print("By "+commentUser + " : " + comment +"<br></h5>");
                                }
%>                              </b></div>
                            <%
                                                    out.print("<hr>");
                              }
                           }
                        } 
                        catch (Exception e) 
                        {
                            System.out.println(e);
                        }
                            %>
                </table>
            </div>
        </div>

        <%@include file="footer.html" %>

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
        <script src="assets/js/custom-file-input.js"></script>
        <script>
            function showQuesIdDiv(quesDivId)
            {
                 $('html, body').animate({
                    scrollTop: $("#"+quesDivId).offset().top
                }, 2000);
                
	    	$('.formcont tr').css('margin-top', 10 + 'px');
            }
        </script>
        </body>
        </html>
