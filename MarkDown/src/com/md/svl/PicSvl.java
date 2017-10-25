package com.md.svl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * Servlet implementation class PicSvl
 */
public class PicSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PicSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SmartUpload smu = new SmartUpload();
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload/pic");
		java.io.File filePath = new java.io.File(rootPath);
		if(!filePath.exists()){
			filePath.mkdirs();   //创建文件目录
		}
		try {
			smu.initialize(this.getServletConfig(), request, response);
			smu.setCharset("utf-8");
			smu.setAllowedFilesList("gif,jpg,png,bmp");
			smu.setMaxFileSize(200*1024);
			smu.upload();
			for(int i = 0; i < smu.getFiles().getCount(); i++){
				File file = smu.getFiles().getFile(i);
				java.io.File realfile = new java.io.File(rootPath+"/"+file.getFileName());
				file.saveAs(realfile.toString());
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				//System.out.println(basePath+"resources/upload/pic/"+file.getFilePathName());
				//返回json串  url作为图片的地址
				response.getWriter().write("{\"success\":1,\"messgae\":\"upload successful\",\"url\":\""+basePath+"resources/upload/pic/"+file.getFilePathName()+"\"}");
			}
		} catch (SmartUploadException e) {
			response.getWriter().write("{\"success\":0}");
			e.printStackTrace();
		}
	}

}
