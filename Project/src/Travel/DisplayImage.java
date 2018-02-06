package Travel;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DisplayImage
 */
@WebServlet(name = "Display", urlPatterns = { "/Display" })
public class DisplayImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//HttpSession session=request.getSession();
			//String s=(String)session.getAttribute("uid");
			Connection conn=null;
			Statement st ;
			
			ServletContext context=getServletContext();
			String dname=context.getInitParameter("driver");
			String urlc=context.getInitParameter("url");
			String pid=request.getParameter("id");
			PrintWriter pw = response.getWriter();
			Class.forName(dname);
			conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
			st=conn.createStatement();
            PreparedStatement ps = conn.prepareStatement("select IMAGE from TOURPACKAGES where PACKAGE_ID='"+pid+"'");
            pw.print(pid);
            // String email = request.getParameter("name");
          //  ps.setString(1,email );
            ResultSet rs = ps.executeQuery();
            rs.next();
            
            Blob b = rs.getBlob("IMAGE");
            response.setContentType("image/jpeg");
            //response.setContentType("text/html");
            response.setContentLength((int) b.length());
            InputStream is = b.getBinaryStream();
            OutputStream os = response.getOutputStream();
            byte buf[] = new byte[(int) b.length()];
            is.read(buf);
            os.write(buf);
            os.close();
            os.flush();
        } 
		catch (Exception ex) 
		{
			PrintWriter ou = response.getWriter();
			ou.print(ex.getMessage());
        }
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}
