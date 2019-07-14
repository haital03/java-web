<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mydatabase.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: #ecd2fc;">
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
        <style>
            .content2
            {
                width:70%;
                height: auto;
                margin-top: 18px;
                margin-left: 340px;
                background:white;
                overflow: auto;
                border: 2px dashed gray;
                border-radius: 20px;
                padding:30px;
                margin-bottom: 50px;
            }
            .notifheader
            {
                width:70%;
                margin-top: 110px;
                margin-left: 340px;
                padding-top: 3px;
                height: 65px;
                background:white;
                box-shadow: 4px 10px 12px 4px rgba(0,0,0,0.2);
            }
            .notif
            {
                width:100%;
                height: 60px;
                border-bottom: 2px solid lightgrey;
                padding: 12px;
            }
            .righttext
            {
                float: right;
                margin-right: 40px
            }
             .close 
            {
                color: #000 ;
                right: 0;
                float: right;
                font-size: 32px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus 
            {
                color: red;
                text-decoration: none;
                cursor: pointer;
            }
            
        </style>
    </head>
    <body data-spy="scroll" data-target="#navmenu" style="background-color: #ecd2fc;">
        <%
            String username = (String)session.getAttribute("username");
            if (username == null) 
            {
                response.sendRedirect("index.jsp");
            }
            DBOperations dbObj = new DBOperations();
            long userId = (long)session.getAttribute("userId");
            long count = dbObj.countNotif(userId);
        %>
        <%@include file="loginheader.jsp" %>
        
            <div class="notifheader">
                <center><h2 style="color: #835FA9"><b>All Notifications for <%=username%>&nbsp;&nbsp;(<%=count%>)</b></h2></center>
            </div>
            <div class="content2">
            <%
                
               // dbObj.notif(userId);
                ResultSet rst = dbObj.getNotif(userId);
                while(rst.next())
                {
                    int notifId = rst.getInt(1);
                    String notif = rst.getString(2);
                    
                    long whosend = rst.getLong(3);
                    String sender = dbObj.getUsername(whosend);
                            
                    String status = rst.getString(5);
                    Timestamp time = rst.getTimestamp(6);
                %>
                <div class="notif">
                  <!--  <form action="deleteNotif.jsp">-->
                    <div>
                        <h4><b><%=notif%>&nbsp;<%=sender%>&nbsp;</b>&nbsp;&nbsp;                    
                            <a href="deleteNotif.jsp?id=<%=notifId%>"><span class="close">&times;</span></a>
                        <span class="righttext">&nbsp;&nbsp;<%=time%></span></h4>
                    </div>
                    
                </div>
                <%
                }
            %>
            
        </div>
            
    </body>
    <%@include file="footer.html"%>
</html>
