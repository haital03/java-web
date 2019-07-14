<%@page import="mydatabase.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
    </head>
    <body>
        <script>
            alert("Logging Out!");
        </script>
        <%
            DBOperations dbObj = new DBOperations();
            dbObj.deleteSessionUser((String)session.getAttribute("username"));
            session.removeAttribute("username");
            session.removeAttribute("users_name");
            session.removeAttribute("userId");
            session.invalidate();
            response.sendRedirect("index.jsp");          
        %>
    </body>
</html>
