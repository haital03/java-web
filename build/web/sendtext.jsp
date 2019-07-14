<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
            if (username == null) 
            {
                response.sendRedirect("index.jsp");
            }
            
        %>
        <%@include file="loginheader.jsp" %>
        
        <%
            String message = (String) request.getParameter("textBySender");
            String sender = (String) session.getAttribute("username");

            String reciever = request.getParameter("user"); //hh
            DBOperations dbObj = new DBOperations();
          //  ResultSet rst = dbObj.viewAll();
         // while (rst.next()) 
          //  {
                //  reciever = rst.getString(4);
              //  recievers.add(rst.getString(4));
          //  }/
                DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("HH:mm:ss ");
                //date
                DateTimeFormatter dtf3 = DateTimeFormatter.ofPattern("yyyy/MM/dd ");
                LocalDateTime now = LocalDateTime.now();
                //System.out.println(dtf.format(now)); 
                String time = dtf2.format(now);
                String date = dtf3.format(now);
                //out.println("this is the text by sender"+message+ teamname+sender +dtf.format(now)+dtf2.format(now)+dtf3.format(now));
                if (dbObj.insertIntoMyChatThisText(sender, message, time, date, reciever)) 
                {  
                    long senderId = dbObj.getUserId(sender);
                    long recieverId = dbObj.getUserId(reciever);
                    String notif = "Your have been sent a text by : ";
                    dbObj.addNotif(notif, senderId, recieverId);
        %>

        <jsp:forward page="chatwalainbox.jsp"/>

        <%
                } 
                else 
                {
                    out.println("text wasnt sent");
                }
        %>
    </body>
</html>
