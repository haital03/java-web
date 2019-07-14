<%@page import="mydatabase.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    
.badge1 
{    
   margin-left: 15px;
   padding-left:0;
   position:relative;
}
.badge1:hover
{
    transform: scale(1.2);
}
.badge1[data-badge]:after 
{
   content:attr(data-badge);
   position:absolute;
   top:-15px;
   right:-10px;
   font-size:1.0em;
   background: #835FA8;
   color:white;
   width:22px;height:22px;
   text-align:center;
   line-height:18px;
   border-radius:50%;
   box-shadow:0 0 1px #333;
}
#badge2 
{    
   margin-left: 0;
   padding-left:0;
   position:relative;
}
#badge2[data-badge]:after 
{
   content:attr(data-badge);
   position:absolute;
   top:-5px;
   right:-5px;
   font-size:.7em;
   background: #835FA8;
   color:white;
   width:18px;height:18px;
   text-align:center;
   line-height:18px;
   border-radius:50%;
   box-shadow:0 0 1px #333;
}
.sidebar 
{
    height: 100%;
    width: 16%;
    position: fixed;
    z-index: 1;
    overflow: scroll hidden;
    top: 0;
    left: 0;
    background-color: #4c4c4c;
}
/*side bar navigation*/
.sidebar a  
{
    margin: 5px;
    background: #4c4c4c;
    width: 96%;
    color: #fff;
    font-family: Verdana,Comic Sans MS;
    font-size: 17px;
    display: inline-block;
    overflow: auto;
    line-height: 46px;
    text-align: left;
   /* border-radius: 30px;*/
    margin-left:4px;
    transition:.800ms;
}

.sidebar a:hover 
{
    background-color: #8655b9;
    color: #fff;
    margin-left: 13px;
    transform: scale(1.1);
} 
.sidebar a:active
{
    background-color: #8655b9;
    color: #fff;
} 
.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 85%;
  left: 550px;
  width:300px;
  right: 0;
}
.autocomplete-items a{
  display:table;
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
  width:100%;
}
.autocomplete-items span:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}
</style>
<%
    DBOperations dobject = new DBOperations();
    long userIdHeader = (long)session.getAttribute("userId");
    int countAllNotifs = dobject.countNotif(userIdHeader);
    int countAllChatNotifs = dobject.countChatNotif(userIdHeader);
%>
<header class="header navbar-fixed-top" style="background : #4c4c4c;width:100%;position: fixed;">
<div class="navbar navbar-default main-menu">
    <div class="container">
        <div class="navbar-header" style="margin-left:-100px;">
                <a  href="services.jsp" class="navbar-brand"><img src="assets/images/iconfinal.jpg" alt="Logo" /></a>
        </div>
        <div class="collapse navbar-collapse">
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                   <div class="autocomplete" style="position: relative;"> <input type="text" class="form-control" placeholder="Search" onkeyup="showResult(this.value)" style="height:47px; line-height:45px;color:white;">
                    <a href="" class="btn_search" style="height:46px; line-height:45px;"><i class="fa fa-search"></i></a>
                    </div><div class="autocomplete-items" id="livesearch"></div>
                    
                    <a href="updateprofile.jsp"  class="hsbtn" onMouseOver="this.style.color='white'">Update</a>
                    <a href="logout.jsp" class="hsbtn" onMouseOver="this.style.color='white'">Logout</a>
                    <a href="notifications.jsp" class="badge1" data-badge="<%=countAllNotifs%>"><i class="fa fa-bell" style="font-size:37px;color: white;"></i></a>
                </div>
            </form>
<!-- haital--- <form autocomplete="off" action="">
<div class="autocomplete" style="width:300px;">
<input id="myInput" type="text" name="myCountry" placeholder="Country">
</div>
<input type="submit">
</form> -->
        </div>
        </div>
    </div> 
</header>
<!-- Side navigation -->
<div class="sidebar">
    <div style="padding-top: 120px;">
    <b>     
        <a href="services.jsp"><i class="fa fa-edit" style="font-size: 28px;"></i>&nbsp;&nbsp;&nbsp;HOME</a>
        <a href="newsamplepaper.jsp"><i class="fa fa-file-text-o" style="font-size: 28px;"></i>&nbsp;&nbsp;SAMPLE PAPER</a>		
        <a href="examupdates.jsp"><i class="fa fa-book" style="font-size: 28px;"></i>&nbsp;&nbsp;EXAM UPDATES</a>
        <a href="projects.jsp"><i class="material-icons" style="font-size: 28px;">archive</i>&nbsp;&nbsp;PROJECTS</a>
        <a href="notifications.jsp"><i class="fa fa-bell"  id="badge2" data-badge="<%=countAllNotifs%>" style="font-size:24px;color: white;"></i>&nbsp;&nbsp;NOTIFICATIONS</a>			
        <a href="chatwalainbox.jsp"><i class="fa fa-comments-o" id="badge2" data-badge="<%=countAllChatNotifs%>" style="font-size:30px;color: white;"></i>&nbsp;&nbsp;&nbsp;INBOX</a>
        <a href="contact.jsp"><i class="fa fa-info-circle" style="font-size: 28px;"></i>&nbsp;&nbsp;&nbsp;CONTACT US</a>
    </b>
    </div>    
</div>
<script>
function showResult(str) {
  if (str.length===0) {
    document.getElementById("livesearch").innerHTML="";
    document.getElementById("livesearch").style.border="0px";
    return;
  }
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else {  // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState===4 && this.status===200) {
      document.getElementById("livesearch").innerHTML=this.responseText;
      document.getElementById("livesearch").style.border="1px solid #A5ACB2";
    }
  };
  xmlhttp.open("GET","livesearch.jsp?q="+str,true);
  xmlhttp.send();
}
</script>