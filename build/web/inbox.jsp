<%@page import="java.sql.ResultSet"%>
<%@page import="mydatabase.DBOperations"%>
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

        <!--Theme Responsive css -->
        <link rel="stylesheet" href="assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/chatmodule.css">
        
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/custom.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
    </head>
    <body data-spy="scroll" data-target="#navmenu">
        <%
            String username = (String)session.getAttribute("username");
            String chatWith = null;
            if (username == null) 
            {
                response.sendRedirect("index.jsp");
            }
        %>
        <%@include file="loginheader.jsp" %>
        
        <div class="chatmodule">
            <div class="chatleft">
                <hr><center><h2><b>Contact</b></h2></center><hr>
                <%
                    DBOperations dbObj = new DBOperations();
                    ResultSet rst = dbObj.viewAll();
                    int count = 0;
                    String chatterName = null;
                    while(rst.next())
                    {
                        String user = rst.getString(4);
                        String name = rst.getString(2);                        
                        if(!user.equals(username))
                        {
                            chatWith = user;
                            System.out.println("testt"+chatWith);
                %>
                <div class="chatleftcontent">
                    <h4><a href="personalinbox.jsp?chatwith='<%=chatWith%>'"><img src="image/businessman.png" alt="image">&nbsp;&nbsp;<%=chatWith%><br><%=name%></a></h4><hr>
                </div>
                <%    
                        }
                        if(count==0)
                        {   
                            chatterName = chatWith;
                        }

                            count++;  

                    }
                %>
            </div>
            <div class="chatinbox">
                <div class="chatinboxheader">
                    <h3>Conversation With : <%=chatWith%></h3>
                </div>
                <div class="messages">
                    <ul>
                    <%
                       ResultSet rst2 = dbObj.fetchAllTextsOfThisUser(chatWith,username);
                       int variable = 1;
                       if (rst2 != null) 
                       {
                           try 
                           {
                               while (rst2.next()) 
                               {
                                   String sender = rst2.getString(2);
                                   System.out.println(sender);
                                   String time = rst2.getString(4);//hh
                                   System.out.println(time);
                                   String date = rst2.getString(5);//hh
                                   System.out.println(date);
                                   String message = rst2.getString(3);
                                   System.out.println(time);

                                   if (variable % 2 == 0) 
                                    {
                    %> 
                        <li>
                            <div class="rightside-right-chat">
                                <span> <small><%=time%>,<%=date%>,</small><%=sender%> <i class="fa fa-circle" aria-hidden="true"></i></span><br><br>
                                <p><%=message%></p>
                            </div>
                        </li>
                        <% 
                                    }
                                    else
                                    {
                        %>
                        <li>
                            <div class="rightside-left-chat">
                                    <span><i class="fa fa-circle" aria-hidden="true"></i> <%=sender%> <small><%=time%>,<%=date%></small> </span><br><br>
                                    <p><%=message%></p>
                            </div>
                        </li>
                        <%          }
                                        variable++;
                                    }
                                } 
                                catch (Exception ex) 
                                {
                                    System.err.println(ex);
                                }
                            } 
                            else 
                            {
                                out.println("There is some problem. Please try again");
                            }
                        %>
                    </ul>
                </div>
                <div class="row">
                <div  style="background-color:white;" class="right-chat-textbox">
                    <form method="post" action="sendtext.jsp?user=<%=chatWith%>">
                        &nbsp;&nbsp;&nbsp;<input type="text" name="textBySender" placeholder="Enter your text here"/>
                       <!-- <a href="sendtext.jsp?chatWith='<%=chatWith%>'"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                   --><div class="fa fa-arrow-right"> <input type="submit" value="SEND "/></div>
                       </form>
                </div>
                </div>
            </div>
        </div>         
        <script type="text/javascript">
            $(document).ready(function()
            {
	    	var height = $(window).height();
	    	$('.left-chat').css('height', (height - 92) + 'px');
	    	$('.right-header-contentChat').css('height', (height - 163) + 'px');
	    });
	</script>
    </body>
</html>