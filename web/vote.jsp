<%-- 
    Document   : vote
    Created on : 5 Apr, 2018, 12:28:50 PM
    Author     : Haital
--%>

<%@page import="mydatabase.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voting</title>
    </head>
    <body>
        <%
            String s = request.getParameter("ansId");
            String voteType = request.getParameter("voteType");
            System.out.println(voteType);
            long ansId = Long.parseLong(s);
            long createdUserId = (long)session.getAttribute("userId");
            DBOperations dbObj = new DBOperations(); 
            dbObj.vote(voteType, ansId, createdUserId); 
            response.sendRedirect("services.jsp");

        %>
    </body>
</html>
