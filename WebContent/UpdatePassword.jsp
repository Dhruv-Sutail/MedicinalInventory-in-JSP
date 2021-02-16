<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="u" class="User.User_details"></jsp:useBean>  
    
<style>
.pass_show{position: relative} 

.pass_show .ptxt { 

position: absolute; 

top: 50%; 

right: 10px; 

z-index: 1; 

color: #f36c01; 

margin-top: -10px; 

cursor: pointer; 

transition: .3s ease all; 

} 

.pass_show .ptxt:hover{color: #333333;} 
</style>

<script>

$(document).ready(function(){
$('.pass_show').append('<span class="ptxt">Show</span>');  
});
  

$(document).on('click','.pass_show .ptxt', function(){ 

$(this).text($(this).text() == "Show" ? "Hide" : "Show"); 

$(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 

});  
</script>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Update Password</title>
</head>
<body>

	<form action = "update.jsp" style = "width: 500px; margin:auto; padding-top:100px;">
			<h1 align = "center" style = "padding-top:5px; padding-bottom:10px;">Set a New Password</h1>
		    <div class="form-group pass_show"> 
                <input type="password"  name ="npass" class="form-control" placeholder="New Password" required> 
            </div> 

            <div class="form-group pass_show"> 
                <input type="password"  name = "ncpass" class="form-control" placeholder="Confirm New Password" required> 
            </div> 
            
            <input type = "submit" value = "Change Password" class = "btn btn-primary">
	</form>
</body>


