<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");

String med_name=request.getParameter("med_name");
int sum=0;

String sql2 = "select quantity from retailer_inventory where med_name=? ";
PreparedStatement ps1 = con.prepareStatement(sql2);
ps1.setString(1,med_name);
ResultSet rs1=ps1.executeQuery();
while(rs1.next()){
	String quantity1=rs1.getString("quantity");
	int q1=Integer.parseInt(quantity1);
	sum=sum+q1;
	
}
out.println(sum);

%>
</body>
</html>