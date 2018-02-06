package Travel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet(name = "L1", urlPatterns = { "/L1" })
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		Connection conn=null;
		
		ServletContext context=getServletContext();
		String dname=context.getInitParameter("driver");
		String urlc=context.getInitParameter("url");
		
	   String uid=request.getParameter("userid");
	   String uname=request.getParameter("name");
	   String upassword=request.getParameter("password");	  
	   String umobileno=request.getParameter("mobileno");
	   String uemailid=request.getParameter("emailid");
	   String uaddress=request.getParameter("address");

	   try{
		Class.forName(dname);
		conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
		PreparedStatement pst=conn.prepareStatement("insert into USERREGISTER values(?,?,?,?,?,?)");
		//'"+uid+"','"+uname+"','"+password+"','"+email+"'"'
		pst.setString(1,uid);
		pst.setString(2,uname);
		pst.setString(3,upassword);
		pst.setString(4,umobileno);
		pst.setString(5,uemailid);
		pst.setString(6,uaddress);
		int i=pst.executeUpdate();
		if(i>0){
		    out.print("Successfully Registered .");	
    		}
    		
    		conn.close();
		    }
    	catch(Exception e) {
    		System.out.println(e);
    	}	
	}


	}

