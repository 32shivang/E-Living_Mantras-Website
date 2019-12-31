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
 * Servlet implementation class YogaExpertServlet
 */
@WebServlet("/YogaExpertServlet")
public class YogaExpertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement psreg;
	private PreparedStatement pslogin;
    /**
     * Default constructor. 
     */
    public YogaExpertServlet() {
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
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String city=request.getParameter("city");
		String gender=request.getParameter("gender");
		String phone=request.getParameter("phone");
		String Qualification=request.getParameter("Qualification");
		String college=request.getParameter("college");
		String experience=request.getParameter("experience");
		String skills=request.getParameter("skills");
		String Certificate=request.getParameter("Certificate");
		
		
		//System.out.println(name+" , "+email+" , "+feedback);
		con=CrudOperation.createConnection();
		try {
			con.setAutoCommit(false);
			String strinsert="insert into logindetails values(?,?,?)";
			pslogin=con.prepareStatement(strinsert);
			pslogin.setString(1, id);
			
			pslogin.setString(2, password);
			pslogin.setString(3, "YogaExpert");
			int row1=pslogin.executeUpdate();
			
			
			String sql="insert into experts values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			psreg=con.prepareStatement(sql);// pass the query to DBMS and DBMS will compile the query and store in buffer
			psreg.setString(1, id);
			psreg.setString(2, name);
			psreg.setString(3, address);
			psreg.setString(4, email);
			psreg.setString(5, city);
			psreg.setString(6, gender);
			psreg.setString(7, phone);
			psreg.setString(8, Qualification);
			psreg.setString(9, college);
			psreg.setString(10, experience);
			psreg.setString(11, skills);
			psreg.setString(12, Certificate);
			psreg.setString(13, "YogaExpert");
			
			
			
			
			int rw=psreg.executeUpdate();// it is used to fire insert update delete query
			if(rw>0 && row1>0) {
				con.commit();
				
				response.sendRedirect("/E-Living_Mantras/Admin/adminhome.jsp");
			}
			else {
				System.out.println("failed");
			}
			
		}
		catch(SQLException se) {
			System.out.println(se);
			
		}
	
	}

}
