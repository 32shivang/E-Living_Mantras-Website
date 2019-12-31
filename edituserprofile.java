package eliving.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import eliving.dbtasks.CrudOperation;

import java.sql.*;

/**
 * Servlet implementation class edituserprofile
 */
@WebServlet("/edituserprofile")
public class edituserprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public edituserprofile() {
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
		HttpSession hs=request.getSession(false);
		String studentid=(String)hs.getAttribute("sessionkey");
		/*if(studentid==null || hs.isNew()){
			
		}
		else {*/
		
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		
		
		
		cn=CrudOperation.createConnection();
		try {
			String strupdate="update userdetails set Name=?,Address=?,PhoneNo=? where Userid=?";
			ps=cn.prepareStatement(strupdate);
			ps.setString(1, name);
			ps.setString(2, address);
			
			ps.setString(3, phone);
			ps.setString(4, studentid);
			
			int row=ps.executeUpdate();
			if(row>0) {
				response.sendRedirect("/E-Living_Mantras/jsp/useraccount.jsp");
			}
			else {
				System.out.println("no");
			}
		}
		
		catch(SQLException se) {
			
		}
	}

}
