<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>MarkDown</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/editormd/examples/css/style.css" />
    <link rel="stylesheet" href="<%=path %>/editormd/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
	
  </head>
  
  <body>
    <div id="layout">
            <header></header>
          <input type="submit" value="提交" onclick="tijiao()"/>
            <div id="test-editormd">
                <textarea style="display:none;" class="editormd-html-textarea" id="editormd"></textarea>
				<textarea class="editormd-html-textarea" name="text" id="editormdhtml"></textarea>
            </div>
            
        </div>
        
        <script src="<%=path %>/editormd/examples/js/jquery.min.js"></script>
        <script src="<%=path %>/editormd/editormd.min.js"></script>
        <script type="text/javascript">
			var testEditor;

            $(function() {
                testEditor = editormd("test-editormd", {
                    width   : "90%",
                    height  : 600,
                    syncScrolling : "single",
                    path    : "<%=path %>/editormd/lib/",
                    imageUpload : true,
                    imageFormats : ["jpg","jpeg","gif","png","bmp","webp"],
                    imageUploadURL : "<%=basePath%>PicSvl",
                    saveHTMLToTextarea : true
                });
           
                /*
                // or
                testEditor = editormd({
                    id      : "test-editormd",
                    width   : "90%",
                    height  : 640,
                    path    : "../lib/"
                });
                */
            });
            
            function tijiao(){
            	var htmlco = $("#editormdhtml").val();
            	//alert(htmlco);
            	$.ajax(
            		{data:{'text':htmlco},
            		  dataType:'text',
            		  success: function(data){
            		  	alert(data);
            		  },
            		  type:'post',
            		  url:'<%=basePath%>TextSvl'
            		}
            	);
            }
        </script>

  </body>
</html>
