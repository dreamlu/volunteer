package com.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serivce.loginSerive;

public class updcl extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public updcl() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		
		String name=(String)session.getAttribute("user_info");
		String user_realname=request.getParameter("user_realname");
		String user_identify=request.getParameter("zhengjian");
		String user_phone=request.getParameter("call");
		String user_college=request.getParameter("college");
		String user_college_sdept=request.getParameter("user_college_sdept");		
		String user_classroom=request.getParameter("class");
		String user_introduce=request.getParameter("jianjie");
		//System.out.println(user_identify);
		
		loginSerive ll=new loginSerive();
		boolean b=ll.loginright3(name,user_realname,user_identify,user_phone,user_college,user_college_sdept,user_classroom,user_introduce);
		if(b){
			session.setAttribute("user_realname" , user_realname);
			session.setAttribute("user_identify" , user_identify);
			session.setAttribute("user_phone" , user_phone);
			session.setAttribute("user_college" , user_college);
			session.setAttribute("user_college_sdept" , user_college_sdept);
			
			session.setAttribute("user_classroom" , user_classroom);
			session.setAttribute("user_introduce" , user_introduce);
			
			request.getRequestDispatcher("home2.jsp").forward(request, response);
		}else
			{
				//request.getRequestDispatcher("home2.jsp").forward(request, response);
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doGet(request,response);
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
