<%@page import="User.*,java.sql.*,javax.swing.JFrame,javax.swing.JOptionPane"%>
<%  
String id=request.getParameter("id");  
int id1=Integer.parseInt(id);
User_details u=User_store.getRecordById(id1);
String name=u.getUname();
//out.println(name);
 Class.forName("com.mysql.jdbc.Driver");  
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");
 PreparedStatement ps=con.prepareStatement(  
		 "update user_details set category='admin' where uname=?");
 		ps.setString(1,name);
 		int i=ps.executeUpdate();
 		if(i>0){
 			JFrame parent = new JFrame();
 		    JOptionPane.showMessageDialog(parent, "Category Updated!!");
 		   response.sendRedirect("user.jsp");
 		}
 		else{
 			JFrame parent = new JFrame();
 		    JOptionPane.showMessageDialog(parent, "Error Occured!!");
 		   response.sendRedirect("user.jsp");
 		}
 
 
%>    