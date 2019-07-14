<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="loginheader.jsp" %>
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
    </head>
    
    <body data-spy="scroll" data-target="#navmenu">
        <%
            String username = (String)session.getAttribute("username");
            if (username == null) 
            {
                response.sendRedirect("index.jsp");
            }
        %>
        
        
        
        
    </body>
</html>