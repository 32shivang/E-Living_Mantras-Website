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
 * Servlet implementation class msgdeleteadmin
 */
@WebServlet("/msgdeleteadmin")
public class msgdeleteadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn,con;
    private PreparedStatement psuser,pslogin;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public msgdeleteadmin() {
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
		
		
		String[] arr=request.getParameterValues("chk");
		
		
		
		try {
			if(arr!=null) {
			String strdelete="delete from inbox where Msgid=?";
			cn=CrudOperation.createConnection();
			cn.setAutoCommit(false);
			psuser=cn.prepareStatement(strdelete);
			for(int i=0;i<arr.length;i++) {
				psuser.setString(1,arr[i] );
				psuser.addBatch();
			}
			int flag=0;
			int[] rows=psuser.executeBatch();
			for(int j=0;j<rows.length;j++) {
				if(rows[j]<0) {
					flag=1;
					break;
				}
			}
			
			
			
	
				
			
			if(flag==0) {
				cn.commit();
				
				response.sendRedirect("/E-Living_Mantras/Admin/admininbox.jsp");
			}
				
		
			}
			else {
				String message="NO RECORD TO DELETE";
				request.setAttribute("msg",message);
				RequestDispatcher rd=request.getRequestDispatcher("/Admin/admininbox.jsp"); 
				rd.forward(request, response);
			}
		}
		
		catch(SQLException se) {
			System.out.println(se);
		}}}
	
		
		
	
	

