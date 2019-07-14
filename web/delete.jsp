<%@page import="mydatabase.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page</title>
    </head>
    <body>
        <%!
            String username;
        %>
        <% 
            username = (String)session.getAttribute("username");
            if(username == null)
            {
                response.sendRedirect("index.jsp");
            }
        %>
        <%
            DBOperations dbObj = new DBOperations();
            dbObj.deleteUser(username);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Deleted!!');");
            out.println("location='delete.jsp';");
            out.println("</script>");
            Thread.sleep(1000);
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
