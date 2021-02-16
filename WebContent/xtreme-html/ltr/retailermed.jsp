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
String name=(String)session.getAttribute("user");
String firm_name=request.getParameter("firm_name");
String med_name=request.getParameter("med_name");
String med_type=request.getParameter("med_type");
String quantity=request.getParameter("quantity");
String sql1 = "select med_type,med_name from medicine where med_type=? and med_name=? ";
PreparedStatement ps1 = con.prepareStatement(sql1);
ps1.setString(1,med_type);
ps1.setString(2,med_name);
ResultSet rs=ps1.executeQuery();
int c=0;
while(rs.next()){
	c=c+1;
}
if(c>=1){
	String med_name1=request.getParameter("med_name");
	int sum=0;

	String sql2 = "select quantity from retailer_inventory where med_name=? ";
	PreparedStatement sp = con.prepareStatement(sql2);
	sp.setString(1,med_name1);
	ResultSet rs1=sp.executeQuery();
	while(rs1.next()){
		String quantity1=rs1.getString("quantity");
		int q1=Integer.parseInt(quantity1);
		sum=sum+q1;		
	}
	String sql3 = "select quantity from medicine where med_name=? ";
	PreparedStatement ps3 = con.prepareStatement(sql3);
	ps3.setString(1,med_name);
	ResultSet rs2=ps3.executeQuery();
	rs2.next();
	String quantity2=rs2.getString("quantity");
	int q2=Integer.parseInt(quantity2);
	int q3=Integer.parseInt(quantity);
	if(sum<=q2 && q3<=q2){	
		String sql = "insert into retailer_inventory(uname,firm_name,med_name,med_type,quantity) values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, firm_name);
		ps.setString(3, med_name);
		ps.setString(4, med_type);
		ps.setString(5, quantity);
		int i=ps.executeUpdate();
		if (i > 0) {
	        System.out.println("Product Added");
	    } else {
	        System.out.println("Product Not Added");
	    }
		response.sendRedirect("Index_retailer.jsp");
		
	}
	else{
		JFrame parent = new JFrame();
	    JOptionPane.showMessageDialog(parent, "Quantity You asked Is Not Available");
	    response.sendRedirect("Index_retailer.jsp");
		
	}

	
}
else{
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "The Medicine You Choose isn't available in the form You Asked");
    response.sendRedirect("Index_retailer.jsp");
}

%>

</body>
</html>