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
 * Servlet implementation class userdelete
 */
@WebServlet("/userdelete")
public class userdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn,con;
    private PreparedStatement psuser,pslogin;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userdelete() {
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
		
		String strdelete="delete from userdetails where Userid=?";
		cn=CrudOperation.createConnection();
		try {
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
			
			
			
			String strdel="delete from logindetails where Userid=?";
			con=CrudOperation.createConnection();
			
				con.setAutoCommit(false);
				pslogin=cn.prepareStatement(strdel);
				for(int i=0;i<arr.length;i++) {
					pslogin.setString(1,arr[i] );
					pslogin.addBatch();
				}
				int f=0;
				int[] row=pslogin.executeBatch();
				for(int j=0;j<row.length;j++) {
					if(rows[j]<0) {
						f=1;
						break;
					}
				
			
			if(flag==0 && f==0  ) {
				cn.commit();
				con.commit();
				response.sendRedirect("/E-Living_Mantras/Admin/DeleteRegsitration.jsp");
			}
				}
		
		}
		
		catch(SQLException se) {
			System.out.println(se);
		}
		
		}
}
