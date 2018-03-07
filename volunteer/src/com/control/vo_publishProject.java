package com.control;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.serivce.vo_adminService;


public class vo_publishProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public vo_publishProject() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		//ServletContext application=request.getServletContext();
		
		String project_name = request.getParameter("project_name");
		String project_organization = request.getParameter("project_organization");
		String project_contact = request.getParameter("project_contact");
		String project_classify = request.getParameter("project_classify");
		String project_introduce = request.getParameter("project_introduce");
		String address[]=new String[2];//第一个为详情页的图片，第二个为首页项目的图片
		int i=0;	
		for (Part part : request.getParts()) {
	            if (part != null && part.getName().startsWith("fileName")) {
	               
	            	//获取请求的信息
	        		String name = part.getHeader("content-disposition");
	        		//System.out.println(name);
	        		String root = request.getServletContext().getRealPath("/upload");
	        		//System.out.println(root);
	        		//判断是否上传的文件，如图片
	        		if(name.lastIndexOf(".")!=-1)
	        		{
	        			String str = name.substring(name.lastIndexOf("."),name.length()-1);
	        			String filename = root+"\\"+UUID.randomUUID().toString()+str;
	        			part.write(filename);
	        			address[i] = "upload"+filename.substring(filename.lastIndexOf("\\"));
	        			//System.out.println(address);
	        			session.setAttribute("address", address);
	        		}
	        		else
	        		{
	        			//address[i] = (String)session.getAttribute("address");
	        		}
	            	i++;
	            }
	        }
		//Part part = request.getPart("fileName");
		//System.out.println(part);
		
		//上传志愿项目
		vo_adminService vo=new vo_adminService();
		//boolean b=
		vo.vo_adminPublishProject(project_name, project_organization, project_contact, project_classify, project_introduce, address[0],address[1]);
		
		//if(!b) request.getRequestDispatcher("volunteer_admin/vo_rootpublishproject.jsp").forward(request, response);;
		//无论成功或成败，返回一些信息
		List<Map<String, Object>> result=vo.vo_adminProjectSelect();
		
		session.setAttribute("publishedProject", result);
		request.getRequestDispatcher("volunteer_admin/vo_rootpublished.jsp").forward(request, response);
		
	}
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		doGet(request, response);
	}

}
