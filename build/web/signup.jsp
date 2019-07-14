<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
            <title>Index Page</title>
            <script type="text/javascript">
            function validateForm()
            {
                var email = document.signupForm.txtEmail.value;
                var password = document.signupForm.txtPassword.value;
                var repeatpassword = document.signupForm.txtPasswordRepeat.value;
                if(password.length < 6)
                {
                    alert("Password should be minimum 6 characters long");
                    return false;
                }
                if(password !== repeatpassword)    //not working
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
                        background-image: url("assets/images/backgrounds.jpg");
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
                      background-color: #8655b9;
                      color: white;
                      padding: 14px 20px;
                      margin: 8px 0;
                      border: none;
                      cursor: pointer;
                      width: 100%;
                      opacity: 0.9;
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
                      width: 50%;
                    }
                    .container 
                    {
                      padding: 16px;
                    }
                    .clearfix::after 
                    {
                      content: "";
                      clear: both;
                      display: table;
                    }

                    /* Change styles for cancel button and signup button on extra small screens */
                    @media screen and (max-width: 300px) 
                    {
                      .cancelbtn, .signupbtn 
                      {
                            width: 100%;
                      }
                    }		
            </style>
    </head>
    <body>
        <form name="signupForm" action="signup.do" method="post" style="border:3px solid #f1f1f1; margin:auto;width:55%;height:40%;background-color:white;" onsubmit="return validateForm();">
          <div class="container">
              <center>
                <h1 style="color:#8655b9;margin-top: 2px;font-family: Lucida Handwriting"><u>Sign Up</u></h1>
                <p style="color:#8655b9;margin-top: 1px;">Please fill in this form to create an account.</p>
              </center>
                <hr>
                <label for="name"><b>Name</b></label>
                <input type="text" placeholder="Enter Name" name="txtName" required/>

                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="txtEmail" required/>

                <label for="username"><b>Username</b></label>
                <input type="text" name="txtUsername" pattern="20[0-9]{2}([a-zA-Z]){3}[0-9]{4}" placeholder="RollNo(e.g. 2000XXX0000)" title="Roll number format" required/>

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="txtPassword" required/>
                
                <label for="psw-repeat"><b>Repeat Password</b></label>
                <input type="password" placeholder="Repeat Password" name="txtPasswordRepeat" required/>
               
                <label>
                  <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"/> Remember me
                </label>

                <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

                <div class="clearfix">
                  <a href="index.jsp"><button type="button" class="cancelbtn">Cancel</button></a>
                  <button type="submit" name="btnsignup" class="signupbtn">Sign Up</button>
                </div>
          </div>
        </form>
    </body>
</html>