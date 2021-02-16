package Retailer;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;

import Retailer.retail;  
public class retail_function {
	
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}
	
	public static List<retail> getAllRecords(){  
	    List<retail> list=new ArrayList<retail>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from retailer_inventory where uname=?");
	        retail u1=new retail();
	        ps.setString(1,u1.getUname());
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	retail u=new retail();  
	            u.setId(rs.getInt("id"));
	            u.setUname(rs.getString("uname"));
	            u.setFirm_name(rs.getString("firm_name"));
	            u.setMed_name(rs.getString("med_name"));  
	            u.setMed_type(rs.getString("med_type"));  
	            u.setQuantity(rs.getString("quantity"));
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}

}
