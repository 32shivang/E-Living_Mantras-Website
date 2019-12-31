package eliving.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eliving.dbtasks.CrudOperation;


import java.sql.*;

/**
 * Servlet implementation class contact
 */
@WebServlet("/contact")
public class contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection cn;
    PreparedStatement pslogin;
    ResultSet rslogin;
    int row;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname=request.getParameter("firstname");
		String lname=request.getParameter("lastname");
		String city=request.getParameter("city");
		String sub=request.getParameter("subject");
		
		cn=CrudOperation.createConnection();
		String strsql="insert into contact values(?,?,?,?)";
		try {
			pslogin=cn.prepareStatement(strsql);
			pslogin.setString(1, fname);
			pslogin.setString(2, lname);
			pslogin.setString(3, city);
			pslogin.setString(4, sub);
			row=pslogin.executeUpdate();
			if( row>0) {
				
				
				response.sendRedirect("/E-Living_Mantras/jsp/userhome.jsp");
			}
		}
		catch(SQLException s) {
			System.out.println(s);
		}
		
		finally {
		if(rslogin!=null) {
			try {
				rslogin.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		}
		
}
	}