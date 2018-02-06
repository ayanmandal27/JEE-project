package Travel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class PlaceDetails
 */
@WebServlet(name = "Place", urlPatterns = { "/Place" })
public class PlaceDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession Session =request.getSession();
		HttpSession s1 =request.getSession();
		
		String str=(String)Session.getAttribute("uid");
		
		String str2=(String)s1.getAttribute("pid");
		PrintWriter out=response.getWriter();
		Connection conn=null;
		
		ServletContext context=getServletContext();
		String dname=context.getInitParameter("driver");
		String urlc=context.getInitParameter("url");
		
		try{
			
			Class.forName(dname);
			conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
			
			String Tmode=request.getParameter("travel");
			String Dt=request.getParameter("date");
			
			HttpSession s3=request.getSession();
			s3.setAttribute("Tmode", Tmode);
			
			HttpSession s4=request.getSession();
			s4.setAttribute("Dt", Dt);

			PreparedStatement pst=conn.prepareStatement("insert into BOOKING values(?,?,?,?)");
			pst.setString(1,str);
			pst.setString(2,Tmode);
			pst.setString(3,Dt);
			pst.setString(4,str2);
			int i=pst.executeUpdate();
			if(i>0){
			    out.print("Successfully Registered .");
			    response.sendRedirect("Receipt.jsp");
	    		}
	    		
	    		conn.close();
	}
catch(Exception e)
		{
		out.println(e);
		}
	    }
		

}
