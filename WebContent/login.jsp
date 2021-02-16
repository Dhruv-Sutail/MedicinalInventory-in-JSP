<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane,User.User_store"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
String Hashedpwd = User.User_store.encryptThisString(pass);
session.setAttribute("user",uname);  
String category = null;
try {
	Class.forName("com.mysql.jdbc.Driver");  
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");
	PreparedStatement ps=con.prepareStatement(
			"select * from user_details where uname=? and pass=?");
	ps.setString(1,uname);  
    ps.setString(2,Hashedpwd); 
    ResultSet rs=ps.executeQuery();
    int c=0;
	while(rs.next()){
		c=c+1;
		category=rs.getString("category");
	}
	if(c==1 && category.equals("admin")){
		System.out.println("Admin Logged In");
		response.sendRedirect("http://localhost:8081/Team_Alpha1/xtreme-html/ltr/Index.jsp");  
	}
	else if(c==1 && category.equals("manager")) {
		System.out.println("Manager Logged In");
		response.sendRedirect("http://localhost:8081/Team_Alpha1/xtreme-html/ltr/Index_manager.jsp");
	}
	else if(c==1 && category.equals("retailer")) {
		System.out.println("Retailer Logged In");
		response.sendRedirect("http://localhost:8081/Team_Alpha1/xtreme-html/ltr/Index_retailer.jsp");
	}
	else if(c==0){
		JFrame parent = new JFrame();
	    JOptionPane.showMessageDialog(parent, "Wrong Credentials!!");
	    response.sendRedirect("Home.html");
	}	        
}
catch(Exception e){System.out.println(e);}	

%>

</body>
</html>