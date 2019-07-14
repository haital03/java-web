<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <script>
            function validate()
            {
                var email = document.updateProfileForm.txtEmail.value;
                var password = document.updateProfileForm.txtPassword.value;
                var repeatpassword = document.updateProfileForm.txtPasswordRepeat.value;
                if(password.length < 6)
                {
                    alert("Password should be minimum 6 characters long");
                    return false;
                }
                if(password !== repeatpassword)
                {
                    alert("Your Passwords do not match");
                    return false;
                }
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) 
                {
                    alert("Not a valid e-mail address");
                    return false;
                }
            }
    </script>
        <style>
                * {box-sizing: border-box}
                html
                {
                    padding-top: 20px;
                    background-image: url("assets/images/bg-01.jpg");
                    background-size: cover;
                }
                input[type=text], input[type=password]
                {
                  width: 100%;
                  padding: 15px;
                  margin: 5px 0 22px 0;
                  display: inline-block;
                  border: none;
                  background: #f1f1f1;
                }

                input[type=text]:focus, input[type=password]:focus 
                {
                  background-color: #ddd;
                  outline: none;
                }

                hr 
                {
                  border: 1px solid #f1f1f1;
                  margin-bottom: 25px;
                }

                button 
                {
                  background-color: skyblue;
                  color: white;
                  padding: 14px 20px;
                  margin: 8px 0;
                  border: none;
                  cursor: pointer;
                  width: 100%;
                  opacity: 0.8;
                }

                button:hover
                {
                  opacity:1;
                }

                .cancelbtn 
                {
                  padding: 14px 20px;
                  background-color: #f44336;
                }

                .cancelbtn, .signupbtn 
                {
                  float: left;
                  width: 33%;
                }

                .container 
                {
                  padding: 16px;
                }

                /* Clear floats */
                .clearfix::after 
                {
                  content: "";
                  clear: both;
                  display: table;
                }

                @media screen and (max-width: 300px) 
                {
                  .cancelbtn, .signupbtn {
                        width: 100%;
                  }
                }		
        </style>
    </head>
    <body>
        <%!
            String name, email, username, password;
        %>
        <% 
            username = (String)session.getAttribute("username");
            if(username == null)
            {
                response.sendRedirect("index.jsp");
            }
        %>
        <%
            username = (String)session.getAttribute("username");
            mydatabase.DBOperations dbObj = new mydatabase.DBOperations();
            ResultSet rst = dbObj.selectUser(username);
            if(rst.next())
            {
                name = rst.getString(1);
                email = rst.getString(2);
                username = rst.getString(3);
                password = rst.getString(4);                
            }
        %>
        
        <form name="updateProfileForm" method="post" action="update.do" style="border:3px solid #f1f1f1; margin:auto;width:50%;height:25%;background-color:white;" onsubmit="return validate()">
          <div class="container">
              <center>
                <h1 style="color:lightskyblue;margin-top: 2px;font-family: Lucida Handwriting"><u>UPDATE  PROFILE</u></h1>
              </center>
                <hr>
                <label for="name"><b>Name</b></label>
                <input type="text"  name="txtName" value="<%=name%>" required>

                <label for="email"><b>Email</b></label>
                <input type="text"  name="txtEmail" value="<%=email%>" required>

                <label for="username"><b>Username</b></label>
                <input type="text" name="txtUsername" value="<%=username%>" disabled>

                <label for="psw"><b>Password</b></label>
                <input type="text" name="txtPassword" value="<%=password%>" required>
                
                <label for="psw-repeat"><b>Confirm Password</b></label>
                <input type="text"  name="txtPasswordRepeat" value="<%=password%>" required>
               
                <div class="clearfix">
                  <a href="services.jsp"><button type="button" class="cancelbtn">Cancel</button></a>
                  <button type="submit" class="signupbtn" style="color: black;font-weight: bold;">Update Profile</button>
                  <a href="delete.jsp"><button type="button" class="cancelbtn">Delete User</button></a>
                </div>
          </div>
        </form>
    </body>
</html>
