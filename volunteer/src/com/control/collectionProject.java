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
 * Servlet implementation class collectionVolunteer
 */
@WebServlet("/collectionProject")
public class collectionProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public collectionProject() {
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
		
		String project_name = request.getParameter("collection");
		String user_name = (String)session.getAttribute("user_info");
		volunteerEnterService vo = new volunteerEnterService();
		

		boolean b = vo.volunteerCollectionProject(user_name, project_name);
		//无论成功或失败，返回一些信息
		List<Map<String, Object>> result = vo.volunteerSelectCollectionProject(user_name);
		//System.out.println(result);
		session.setAttribute("collectionProject_info", result);
		if(b)
		{
			response.getWriter().println("收藏成功，期待您的参与");
		}

		else 
		{
			response.getWriter().println("取消收藏，期待您的再次参与");
		}
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
