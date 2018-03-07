package com.control;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serivce.volunteerEnterService;

/**
 * Servlet implementation class volunteerAdmin
 */
@WebServlet("/volunteerAdmin")
public class volunteerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public volunteerAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		//String root_name = (String)session.getAttribute("admin");
		String volunteer_name = request.getParameter("volunteer_name");
		session.setAttribute("volunteer_name", volunteer_name);
		volunteerEnterService vo = new volunteerEnterService();
		//admin查询报名信息
		List<Map<String, Object>> result = vo.volunteerselect(volunteer_name);
		
		session.setAttribute("volunteerInfo", result);
		request.getRequestDispatcher("volunteer_admin/manage_select.jsp").forward(request, response);;
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		doGet(request, response);
	}

}
