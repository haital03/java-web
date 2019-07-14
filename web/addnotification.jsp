<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mydatabase.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = (String)session.getAttribute("username");
            int userId = (Integer)session.getAttribute("userId");
            DBOperations dbObj = new DBOperations();
        /*    ArrayList<Long> postedQuesId = dbObj.getQuesByThisUser(userId);
            int ansCreatedBy = 0,ansid = 0;
            for(long quesids : postedQuesId)
            {
                ResultSet rst = dbObj.getAnsByThisId(quesids);
                while(rst.next())
                {
                    ansid = rst.getInt(1);
                    ansCreatedBy = rst.getInt(2);
                    String notif = "Your question has been answered By : ";
                    dbObj.addNotif(notif, ansCreatedBy, userId);
                }
            }
*/        %>
    </body>
</html>