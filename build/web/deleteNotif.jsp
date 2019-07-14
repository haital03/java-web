<%@page import="mydatabase.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            DBOperations dbObj = new DBOperations();
            String notifId = request.getParameter("id");
            boolean status = dbObj.deleteNotif(Integer.parseInt(notifId));
            if(status == true)
                response.sendRedirect("notifications.jsp");
            else
                response.sendRedirect("notifications.jsp");
        %>
    </body>
</html>
