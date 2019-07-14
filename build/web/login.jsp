<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Index Page</title>        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script>            
            function myFunction(divId)
            {
                var x = document.getElementById(divId);
                var y = document.getElementById('id02');
                if (x.style.display === "none")
                {
                    x.style.display = "block";
                    
                } 
                else
                {
                    x.style.display = "none";
                }
                var modal = document.getElementById('id01');
                window.onclick = function(event) 
                {
                    if (event.target === modal) 
                    {
                        modal.style.display = "none";
                    }
                };
            }
            // When the user clicks anywhere outside of the modal, close it
            
        </script>
        <style>
            .modal 
            {
                display: none; 
                position: fixed; 
                z-index: 1;
                padding-top: 150px; 
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0); /* Fallback color added now :--> */
                background-color: rgba(0,0,0,0.4);
            }

            .modal-content 
            {
                background-color: white;
                margin: auto;
                padding: 20px;
                width: 100%;
                height: 100%;
            }
            .close 
            {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus 
            {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            } 
            .modal form
            {
                background-color: white;
                margin:auto;
                width: auto;
                height: auto;
            }
            html
            {
                padding-top: 50px;
                background-image: url("assets/images/backgrounds.jpg");
            }
            form
            { 
                    background-color: white;
                    margin:auto;
                    border: 3px solid #f1f1f1;
                    width:65%;
                    height:70%;
            }

            input[type=text], input[type=password]
            {
                    width: 100%;
                    padding: 12px 20px;
                    margin: 8px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    box-sizing: border-box;
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
            }
            button:hover 
            {
                    opacity: 0.8;
            }
            .cancelbtn
            {
                    width: auto;
                    padding: 10px 18px;
                    background-color: #f44336;
            }
            .imgcontainer 
            {
                    text-align: center;
                    margin: 10px 0 6px 0;
            }
            img.avatar
            {
                    width: 25%;
                    border-radius: 50%;
            }

            .container 
            {
                    padding: 10px;
                    width:65%;
                    height:70%;
                    margin:auto;
            }

            span.psw 
            {
                    float: right;
                    padding-top: 16px;
                    border:none;
                    
            }

            @media screen and (max-width: 300px)
            {
                    span.psw 
                    {
                            display: block;
                            float: none;
                    }
                    .cancelbtn 
                    {
                            width: 100%;
                    }
            }
        </style>
    </head>
    <body>
        <form method="post" action="login.do" id="id02" class="container">
            <div class="imgcontainer">
                  <img src="assets/images/loginimg.png" alt="Avatar" class="avatar">
            </div>
            <div class="container">
                  <label for="uname"><b>Username</b></label>
                  <input type="text" placeholder="Enter Username" name="txtUsername" required>

                  <label for="psw"><b>Password</b></label>
                  <input type="password" placeholder="Enter Password" name="txtPassword" required>

                  <button type="submit">Login</button>
                  <label>
                    <input type="checkbox" checked="checked" name="remember"> Remember me
                  </label>
            </div>
            
        </form>
        <div class="container" style="background-color:#f1f1f1">
            <a href="index.jsp"><button type="button" class="cancelbtn" style="margin-left: 190px;">Cancel</button></a>
            <button class="cancelbtn" id="mybtn" style="border:none;float:right;margin-right: 175px;" onclick="myFunction('id01')">Forgot password?</button>
        </div>
        
        <center>   
        <div class="modal" id="id01" style="display:none;">
            <div class="w3-modal-content w3-animate-zoom" style="width:40%; height:70%;">
                <div class="modal-content">
                <span class="close" onclick="document.getElementById('id01').style.display='none'">&times;</span>
                <center><h2 style="color:purple;font-family: Comic Sans MS,Verdana;"><b><u>FORGOT PASSWORD ?</u></b></h2>
                    <h5>( If email entered by you matches your registered email, password will be sent to that email address )</h5></center>
                    <br>
                <form method="post" action="forgotPassword.do" style="border:none;">
                    <label for="uname" style="color:purple;"><b>Username</b></label>
                    <input type="text" placeholder="Enter your Username" name="txtUsername" required/>
                    <label for="email" style="color:purple;"><b>Email address</b></label>
                    <input type="text" placeholder="Enter your registered Email Address" name="txtConfirmEmail" required/>
                    <button type="submit">Send Mail</button>
                </form>
                </div>
            </div>
        </div>
        </center>    
    </body>
</html>	
