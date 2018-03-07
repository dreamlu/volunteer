package com.control;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.serivce.loginSerive;


public class UpLoad extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Part part = request.getPart("fileName");
		//获取请求的信息
		String name = part.getHeader("content-disposition");
		//System.out.println(name);
		String root = request.getServletContext().getRealPath("/upload");
		//String root = request.getServletContext().getRealPath("deercode.cn/images");
		//System.out.println(root);
		if(name.lastIndexOf(".")!=-1)
		{
			String str = name.substring(name.lastIndexOf("."),name.length()-1);
			String filename = root+"\\"+UUID.randomUUID().toString()+str;
			part.write(filename);
			String address = "upload"+filename.substring(filename.lastIndexOf("\\"));
			
			//更新用户头像
			HttpSession session = request.getSession();
			String user_name = (String)session.getAttribute("user_info");
			loginSerive ll=new loginSerive();
			boolean b=ll.loginright4(user_name,address);
			
			if(b)
			{
				session.setAttribute("user_picture", address);
				request.getRequestDispatcher("home2.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("home2.jsp").forward(request, response);
			}
			
		}
	
	}
} 