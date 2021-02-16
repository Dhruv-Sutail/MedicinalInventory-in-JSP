package Admin;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import Admin.med_store;
import  javax.swing.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class med_function {
	
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}
	public static int save(med_store u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into medicine(med_name,med_type,quantity,price) values(?,?,?,?)");  
	        ps.setString(1,u.getMed_name());  
	        ps.setString(2,u.getMed_type());  
	        ps.setString(3,u.getQuantity());  
	        ps.setString(4,u.getPrice());    
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static List<med_store> getAllRecords(){  
	    List<med_store> list=new ArrayList<med_store>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from medicine");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	med_store u=new med_store();  
	            u.setId(rs.getInt("id"));  
	            u.setMed_name(rs.getString("med_name"));  
	            u.setMed_type(rs.getString("med_type"));  
	            u.setQuantity(rs.getString("quantity"));
	            u.setPrice(rs.getString("price"));
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}
	
	public static int update1(med_store u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"update medicine set med_name=?,med_type=?,quantity=?,price=? where id=?");  
	        ps.setString(1,u.getMed_name());  
	        ps.setString(2,u.getMed_type());  
	        ps.setString(3,u.getQuantity());  
	        ps.setString(4,u.getPrice());    
	        ps.setInt(5,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	
	public static med_store getRecordById(int id){  
		med_store u=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from medicine where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new med_store();  
	            u.setId(rs.getInt("id"));  
	            u.setMed_name(rs.getString("med_name"));  
	            u.setMed_type(rs.getString("med_type"));  
	            u.setQuantity(rs.getString("quantity"));  
	            u.setPrice(rs.getString("price"));    
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  
	
	public static int delete(med_store u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from medicine where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
}
