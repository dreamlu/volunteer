package com.control;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serivce.loginSerive;
import com.serivce.userService;
import com.serivce.volunteerEnterService;

public class loginlc extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public loginlc() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
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
		
		String exit=request.getParameter("exit");
		if(exit!=null && exit.equals("exit"))
		{
			session.invalidate();
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		String name=request.getParameter("user");
		String pwd=request.getParameter("password");
		String college=request.getParameter("college");
		String sub = request.getParameter("Submit");
		
		
		String user_identify=null;
		String user_phone=null;
		String user_college=null;
		String user_classroom=null;
		String user_college_sdept=null;
		String user_introduce=null;
		String user_picture=null;
		String user_realname=null;
		String user_love=null;
		//System.out.println(sub);
		
		//System.out.println(pwd);
		loginSerive ll=new loginSerive();
		userService user=new userService();
		
		boolean b;
		if(sub.equals("register"))//注册
		{
			b=ll.loginright1(name,pwd,college);
		}
		else//登陆，这是一处败笔啊，语句不够精简，懒得改了
		{	
			b=ll.loginright(name,pwd);
			if(!b)
			{
				request.setAttribute("user_register", "呢称或密码错误");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
			List<Map<String,Object>> result = user.loginright(name);
			if(result==null) ;
			//查询个人信息
			Map<String,Object> info = result.get(0);
			user_identify=(String)info.get("user_identify");
			user_phone=(String)info.get("user_phone");
			user_college=(String)info.get("user_college");
			user_college_sdept=(String)info.get("user_college_sdept");
			user_classroom=(String)info.get("user_classroom");
			user_introduce=(String)info.get("user_introduce");
			user_picture = (String)info.get("user_picture");
			user_realname = (String)info.get("user_realname");
			user_love = String.valueOf(info.get("user_love"));//我去，这里直接用Integer转换竟然会报错
			//System.out.println(user_picture);
			//System.out.println("夸海口"+user_love);
			//user_picture=(String)a_info.get("volunteer_picture_path");
			if(user_picture!= null)
			{
				int i = user_picture.indexOf("upload");
				user_picture = user_picture.substring(0,i+6)+"\\"+user_picture.substring(i+6);
			} 		
			//System.out.println(b);
			//报名的活动
			volunteerEnterService voEnter = new volunteerEnterService();
			List<Map<String,Object>> clientEn = voEnter.volunteerselectClient(name);
			
			session.setAttribute("clientEn", clientEn);
			
			//收藏的活动信息
			//volunteerEnterService vo = new volunteerEnterService();
			List<Map<String, Object>> re = voEnter.volunteerSelectCollection(name);
			//System.out.println(re);
			session.setAttribute("collection_info", re);
			
			//收藏的项目信息
			List<Map<String, Object>> rePro = voEnter.volunteerSelectCollectionProject(name);
			//System.out.println(result);
			session.setAttribute("collectionProject_info", rePro);
			
		}
		//注册或登陆成功
		if(b)
		{
			//List<Map<String,Object>> result=l.loginright();
			session.setAttribute("user_info" , name);
			session.setAttribute("user_realname" , user_realname);
			session.setAttribute("user_identify" , user_identify);
			session.setAttribute("user_phone" , user_phone);
			session.setAttribute("user_college" , user_college);
			session.setAttribute("user_college_sdept" , user_college_sdept);
			session.setAttribute("user_classroom" , user_classroom);
			session.setAttribute("user_introduce" , user_introduce);
			session.setAttribute("user_picture" , user_picture);
			session.setAttribute("user_love", user_love);
			//request.setAttribute("user_register", "注册成功~");
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("user_register", "昵称已经注册");
			request.getRequestDispatcher("login.jsp").forward(request, response);
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
