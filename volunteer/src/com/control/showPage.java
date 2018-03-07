package com.control;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.serivce.userService;
import com.serivce.vo_adminService;
import com.serivce.volunteerEnterService;

/**
 * Servlet implementation class showPage
 */
@WebServlet("/showPage")
public class showPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showPage() {
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
		
		//session对象
		//HttpSession session = request.getSession();
		ServletContext application = this.getServletContext();
		
		//查询志愿活动信息
		userService user=new userService();
		List<Map<String,Object>> result = user.loginright_activity();
		application.setAttribute("activity_info", result);
		
		//查询志愿项目信息
		vo_adminService vo=new vo_adminService();
		List<Map<String,Object>> re=vo.vo_adminProjectSelect();
		application.setAttribute("project_info", re);
		
		/*//宣传总结信息的发布，图标更新
		volunteerEnterService vo2 = new volunteerEnterService();
		List<Map<String, Object>> res=vo2.volunteerSelectPublishAndSum();
		application.setAttribute("AllpublishAndSum", res);*/
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		 
		doGet(request,response);
	}

}
