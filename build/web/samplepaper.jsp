<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="mydatabase.DBOperations"%>
<%@include file="loginheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- For Plugins external css -->
        <link rel="stylesheet" href="assets/css/plugins.css" />

        <!-- Theme custom css  -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--Theme Responsive css -->
        <link rel="stylesheet" href="assets/css/responsive.css" />
        
        
        <link rel="stylesheet" href="assets/css/fileuploadstyle.css">
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>


        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
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
        
        <style type="text/css">
        embed
        {
             pointer-events: none;
        }
        a{
            display: block;
        }
        </style>
        
    </head>
    <body data-spy="scroll" data-target="#navmenu">
        <%!
            String desc = null;
            String paperFile = null;
            Timestamp creationTime = null;  
            String createdBy = null;
            long paperId = 0;
        %>
        <%
            String username = (String)session.getAttribute("username");
            if (username == null) 
            {
                response.sendRedirect("index.jsp");
            }
        %>
        

        <div class="agile-its">
            <div class="w3layouts">
                <div class="photos-upload-view">
                    <center><h2>Upload Sample Paper</h2></center>
                    <form id="upload" action="postsamplepaper.jsp" method="POST" enctype="multipart/form-data">
                         <div class="agileinfo">
                            <input type="file"  name="fileselect"/> 
                        </div> 
                        <div id="desc" style="color:black;">
                           <!-- <center><p>( Enter description )</p></center>-->
                           <b><textarea rows="10" cols="100" placeholder="Enter Description..." style="width:100%;height:100px;margin-top: 20px;color:black;" name="txtDesc"></textarea>
                           </b>
                        </div>
                        <input type="reset" value="Cancel" id="postpaperbtn"/>
                        <input type="submit" value="Post" id="postpaperbtn" style="float:right;" />
                    </form>
                </div>
                <div class="clearfix"></div>
                <script src="assets/js/filedrag.js"></script>
            </div>
        </div>
        <div class="content">
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
                                    out.println("<h3>"+desc+"<br></h3><h4><a href='"+paperFile+"' target='_blank'><u>View File In New Tab</u></a></h4>");
                                    out.println("<b>[ Posted By : "+createdBy+" , "+creationTime+" ]</b>");
                                %>
                            </td>
                            <td class="col2">
                                <%
                                    if(paperFile.endsWith(".pdf") || paperFile.endsWith(".docx"))
                                    {
                                        System.out.println("pdf embed : "+paperFile);
                                %>
                                <a href=" <%=paperFile%>" target="_blank">
                                    <embed src ="<%=paperFile%>" id="showfile" onclick="myFunction1(this)"/>
                                </a>
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
                                    <img src="<%=paperFile%>" id="showfile" onclick="myFunction2(this)"/>
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
<script type="text/javascript" src="assets/js/jquery.min.js"></script> 
    </body>
</html>