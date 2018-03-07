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

import com.serivce.vo_adminService;

/**
 * Servlet implementation class detail_project
 */
@WebServlet("/detail_project")
public class detail_project extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detail_project() {
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
		HttpSession session=request.getSession();
		
		
		String project_name=request.getParameter("project_name");
		//查询志愿项目信息
		vo_adminService vo=new vo_adminService();
		List<Map<String,Object>> re=vo.vo_adminProjectSelect(project_name);
		session.setAttribute("project_info", re);
		
		//查询关联的志愿活动信息
		List<Map<String,Object>> reP=vo.vo_adminProject_VolunteerSelect(project_name);
		session.setAttribute("project_actvity", reP);
		//System.out.println(reP);
		request.getRequestDispatcher("detail_project.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		doGet(request, response);
	}

}
