package User;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import User.User_details;
import  javax.swing.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
public class User_store  {
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}  
	
	public static int save(User_details u){  
	    int status=0;  
	    try{  
	    	String Hashedpwd = User_store.encryptThisString(u.getPass());
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into user_details(uname,pass,cpass,email,category) values(?,?,?,?,?)");  
	        ps.setString(1,u.getUname());  
	        ps.setString(2,Hashedpwd);   
	        ps.setString(3,u.getCpass());  
	        ps.setString(4,u.getEmail());  
	        ps.setString(5,u.getCategory());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	
	public static void login(User_details u) {
		String category = null;
		try {
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement(
					"select * from user_details where uname=? and pass=?");
			ps.setString(1,u.getUname());  
	        ps.setString(2,u.getPass()); 
	        ResultSet rs=ps.executeQuery();
	        int c=0;
			while(rs.next()){
				c=c+1;
				category=rs.getString("category");
			}
			if(c==1 && category.equals("admin")){
				System.out.println("Admin Logged In");
			}
			else if(c==1 && category.equals("manager")) {
				System.out.println("Manager Logged In");
			}
			else if(c==1 && category.equals("retailer")) {
				System.out.println("Retailer Logged In");
			}
			else if(c==0){
				JFrame parent = new JFrame();
			    JOptionPane.showMessageDialog(parent, "Wrong Credentials!!");
			}	        
		}
		catch(Exception e){System.out.println(e);}	
	}
	
	public static int mail(User_details u) {
		int status=0;
		 String result;

		    //final String to = request.getParameter("mail");
		    final String from = "manavvagdoda18@gnu.ac.in";
		    final String pass = "ronankilledthanos";

		    String host = "smtp.gmail.com";
		    Properties props = new Properties();
		    props.put("mail.smtp.host", host);
		    props.put("mail.transport.protocol", "smtp");
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.user", from);
		    props.put("mail.password", pass);
		    props.put("mail.port", "465");

		    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
		        @Override
		        protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication(from, pass);

		        }

		    });

		    try {
		        MimeMessage message = new MimeMessage(mailSession);
				message.setFrom(new InternetAddress(from));
		   //     message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		        message.setSubject("Reset Password Link");
		        message.setText("http://localhost:8081/Team_Alpha/UpdatePassword.jsp");
		        Transport.send(message);
		       
		        
		    } catch (MessagingException mex) {
		        mex.printStackTrace();
		        result = "Error: unable to send mail....";

		    }
		    return status;
	}
	
	public static User_details getRecordById(int id){  
	    User_details u=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from user_details where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new User_details();  
	            u.setId(rs.getInt("id"));  
	            u.setUname(rs.getString("uname"));  
	            u.setPass(rs.getString("pass"));  
	            u.setEmail(rs.getString("email"));    
	            u.setCategory(rs.getString("category"));  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  
	public static List<User_details> getAllRecords(){  
	    List<User_details> list=new ArrayList<User_details>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from user_details");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            User_details u=new User_details();  
	            u.setId(rs.getInt("id"));  
	            u.setUname(rs.getString("uname"));  
	            u.setPass(rs.getString("pass"));  
	            u.setEmail(rs.getString("email"));  
	            u.setCategory(rs.getString("category"));    
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	
	public static String encryptThisString(String input) 
    { 
        try { 
            MessageDigest md = MessageDigest.getInstance("SHA-256"); 	  
            byte[] messageDigest = md.digest(input.getBytes()); 
            BigInteger no = new BigInteger(1, messageDigest); 
            String hashtext = no.toString(16); 
   
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
            return hashtext; 
        }
        catch (NoSuchAlgorithmException e) { 
            throw new RuntimeException(e); 
        } 
    }

}
