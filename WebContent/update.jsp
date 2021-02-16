<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane,User.User_store"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String npass=request.getParameter("npass");
String Hashedpwd = User.User_store.encryptThisString(npass);
String ncpass=request.getParameter("ncpass");
String email=(String)session.getAttribute("email");
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");
String query="update user_details set pass=?,cpass=? where email=?";
PreparedStatement smt=con.prepareStatement(query);
smt.setString(1, Hashedpwd);
smt.setString(2, ncpass);
smt.setString(3, email);
int i=smt.executeUpdate();
if (i > 0) {
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "Password Updated!!");
    System.out.println("Data Updated");
    response.sendRedirect("Home.html");
} else {
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "Some Error Occurred!!");
    System.out.println("Data not Updated");
    response.sendRedirect("Home.html");
}
%>
</body>
</html>