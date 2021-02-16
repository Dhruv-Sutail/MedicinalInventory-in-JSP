package Retailer;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import Retailer.feedback;  
public class feedback_function {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}  
	
	public static int save(feedback u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into retailer_request(firm_name,med_requirement,feedback) values(?,?,?)");  
	        ps.setString(1,u.getFirm_name());  
	        ps.setString(2,u.getMed_requirement());  
	        ps.setString(3,u.getFeedback());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static List<feedback> getAllRecords(){  
	    List<feedback> list=new ArrayList<feedback>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from retailer_request");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	feedback u=new feedback();  
	            u.setId(rs.getInt("id"));  
	            u.setFirm_name(rs.getString("firm_name"));  
	            u.setMed_requirement(rs.getString("med_requirement"));  
	            u.setFeedback(rs.getString("feedback"));    
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	
	public static feedback getRecordById(int id){  
		feedback u=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from retailer_request where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new feedback();  
	            u.setId(rs.getInt("id"));  
	            u.setFirm_name(rs.getString("firm_name"));  
	            u.setMed_requirement(rs.getString("med_requirement"));  
	            u.setFeedback(rs.getString("feedback"));    
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  

}
