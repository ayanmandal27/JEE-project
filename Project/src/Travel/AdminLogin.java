package Travel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlt
 */
@WebServlet(name = "L2", urlPatterns = { "/L2" })
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String id=request.getParameter("AdminId");
		String pass=request.getParameter("Password");
		HttpSession s=request.getSession();
		s.setAttribute("ABCD", id);
		
		Connection conn=null;
		
		ServletContext context=getServletContext();
		String dname=context.getInitParameter("driver");
		String urlc=context.getInitParameter("url");
		try {
			Class.forName(dname);
			conn=DriverManager.getConnection(urlc, "JEE_UEM", "12345");
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery("select ADMIN_ID,PASSWORD from ADMIN where ADMIN_ID='"+id+"' and PASSWORD='"+pass+"'");
			if(rs.next()) {
				  response.sendRedirect("AdminOptions.jsp");
			}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("AdminLogin.jsp");
			rd.include(request, response);
			out.print("Wrong UserName or Password");
		}
		}catch(Exception e) {
			System.out.println(e);
			}
	}

}
