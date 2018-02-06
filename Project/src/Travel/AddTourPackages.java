package Travel;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet(name = "L6", urlPatterns = { "/L6" })
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class AddTourPackages extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		Connection conn=null;
		String message = null;
		
		ServletContext context=getServletContext();
		String dname=context.getInitParameter("driver");
		String urlc=context.getInitParameter("url");
		
	   String pid=request.getParameter("packid");
	   String place=request.getParameter("addplace");
	   String nnop=request.getParameter("nop");	  
	   String udesc=request.getParameter("desc");
	   String ustfd=request.getParameter("stfd");
	   String utramt=request.getParameter("tramt");
	   String uflamt=request.getParameter("flamt");
	   String unod=request.getParameter("nod");
	   String unon=request.getParameter("non");
	 
	   InputStream inputStream = null; // input stream of the upload file
       
       // obtains the upload file part in this multipart request
       Part filePart = request.getPart("photo");
       if (filePart != null) {
           // prints out some information for debugging
           out.println(filePart.getName());
           out.println(filePart.getSize());
           out.println(filePart.getContentType());
            
           // obtains input stream of the upload file
           inputStream = filePart.getInputStream();
       }
	  
	   try{
		Class.forName(dname);
		conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
		PreparedStatement pst=conn.prepareStatement("insert into TOURPACKAGES values(?,?,?,?,?,?,?,?,?,?)");
		
		pst.setString(1,pid);
		pst.setString(2,place);
		pst.setString(3,nnop);
		pst.setString(4,udesc);
		pst.setString(5,ustfd);
		pst.setString(6,utramt);
		pst.setString(7,uflamt);
		pst.setString(8,unod);
		pst.setString(9,unon);
		 
        if (inputStream != null) {
            // fetches input stream of the upload file for the blob column
            pst.setBlob(10, inputStream);
        }

        // sends the statement to the database server
        int row = pst.executeUpdate();
        if (row > 0) {
            message = "File uploaded and saved into database";
        }
    } catch (Exception ex) {
        message = "ERROR: " + ex.getMessage();
        ex.printStackTrace();
    } finally {
        if (conn != null) {
            // closes the database connection
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        // sets the message in request scope
        request.setAttribute("Message", message);
         
        // forwards to the message page
        getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
    }
}
}