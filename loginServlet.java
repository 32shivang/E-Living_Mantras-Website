package eliving.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eliving.dbtasks.CrudOperation;

import java.sql.*;
/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection cn;
    PreparedStatement pslogin;
    ResultSet rslogin;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		String userid=request.getParameter("username");
		String userpassword=request.getParameter("userpass");
		
		
	
		cn=CrudOperation.createConnection();
		String strsql="select * from logindetails where Userid=? and Userpass=?";
		try {
			pslogin=cn.prepareStatement(strsql);
			pslogin.setString(1, userid);
			pslogin.setString(2, userpassword);
			rslogin=pslogin.executeQuery();
			if(rslogin.next()) {//if id and password is there in the database
				
				// session creation......................................
				
				HttpSession hs=request.getSession();
				hs.setAttribute("sessionkey", userid);
				
				
				//........................................................
				String utype=rslogin.getString("Usertype");
				
				// session for utype........................
				hs.setAttribute("sessiontype",utype );
				//...........................................
				
				if(utype.equals("admin")) {
					response.sendRedirect("/E-Living_Mantras/Admin/adminhome.jsp");
				}
				else if(utype.equals("YogaExpert")) {
					response.sendRedirect("/E-Living_Mantras/Dietician/DietYogahome.jsp");
				}
				else if(utype.equals("Dietician")) {
					response.sendRedirect("/E-Living_Mantras/Dietician/DietYogahome.jsp");
				}
				else if(utype.equals("user")) {
					response.sendRedirect("/E-Living_Mantras/jsp/userhome.jsp");
				}
			}
		
		
		/*if(userid.equals("shivang") && userpassword.equals("shivang32")) {
			// we have to send a message to jsp page successfull login
			response.sendRedirect("/ecollege/jsp/userhome.jsp");}*/
		
		else {
			// it is a reuest scope:
			// we have to send message to jsp page that user id and password is wrong
			String message="Invalid user Id or Password";
			request.setAttribute("msg",message);
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");// we will have to give only relative path 
			// ctrl+shift+o is used to import package directly
			rd.forward(request, response);
			//response.sendRedirect("/ecollege/jsp/login.jsp");
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
		if(pslogin!=null)
			try {
				pslogin.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
