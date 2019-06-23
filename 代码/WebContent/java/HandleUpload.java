package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleUpload extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}
    	catch(Exception e) {}
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)
    throws ServletException,IOException {
    	HttpSession session=request.getSession(true);
    	String bookISBN=(String)session.getAttribute("bookISBN");
    	String ISBN=(String)session.getAttribute("ISBN");
    	String AF=(String)session.getAttribute("AorF");
    	if(AF=="A") {
    		uploadFileMethod(request,response,ISBN);
    	} else {
    	    uploadFileMethod(request,response,bookISBN);
    	}
    }
    public void uploadFileMethod(HttpServletRequest request,HttpServletResponse response,String logname)
    throws ServletException,IOException {
    	UploadFile upFile=new UploadFile();
    	String backNews="";
    	try {
    		HttpSession session=request.getSession(true);
    		request.setAttribute("upFile",upFile);
    		String tempFileName=(String)session.getId();
    		File f1=new File(tempFileName);
    		FileOutputStream o =new FileOutputStream(f1);
    		InputStream in=request.getInputStream();
    		byte b[] = new byte[10000];
    		int n;
    		while((n=in.read(b))!=-1) {
    			o.write(b,0,n);
    		}
    		o.close();
    		in.close();
    		RandomAccessFile random=new RandomAccessFile(f1,"r");
    		int second=1;
    		String secondLine=null;
    		while(second<=2) {
    			secondLine=random.readLine();
    			second++;
    		}
    		int position=secondLine.lastIndexOf('\\');
    		String fileName=secondLine.substring(position+1,secondLine.length()-1);
    		byte cc[]=fileName.getBytes("ISO-8859-1");
    		fileName=new String(cc);
    		fileName=fileName.replaceAll(" ","");
    		String checkedStr=fileName.substring(0,fileName.indexOf("."));
    		boolean isLetterOrDigit=true;
    		for (int i=0; i < checkedStr.length(); i++) {
    			char c=checkedStr.charAt(i);
    			if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0'))) {
    				isLetterOrDigit=false;
    				break;
    			}
    		}
    		if (isLetterOrDigit==false) {
    			response.sendRedirect("upload.jsp");
    		}
    		String savedFileName=logname.concat(fileName);
    		random.seek(0);
    		long forthEndPosition=0;
    		int forth=1;
    		while((n=random.readByte())!=-1&&(forth<=4)) {
    			if(n=='\n') {
    				forthEndPosition=random.getFilePointer();
    				forth++;
    			}
    		}
    		File dir=new File("C:/Users/admin/eclipse-workspace/tushuguan/image");
    		dir.mkdir();
    		File file[]=dir.listFiles();
    		for (int k = 0; k < file.length; k++) {
    			if(file[k].getName().startsWith(logname)) {
    				file[k].delete();
    			}
    		}
    		File savingFile=new File(dir,savedFileName);
    		RandomAccessFile random2=new RandomAccessFile(savingFile,"rw");
    		random.seek(random.length());
    		long endPosition=random.getFilePointer();
    		long mark=endPosition;
    		int j=1;
    		while((mark>=0)&&(j<=6)) {
    			mark--;
    			random.seek(mark);
    			n=random.readByte();
    			if(n=='\n') {
    				endPosition=random.getFilePointer();
    				j++;
    			}
    		}
    		random.seek(forthEndPosition);
    		long startPoint=random.getFilePointer();
    		while(startPoint<endPosition-1) {
    			n=random.readByte();
    			random2.write(n);
    			startPoint=random.getFilePointer();
    		}
    		random2.close();
    		random.close();
    		String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
    		String ur2="jdbc:mysql://localhost:3306/article?useSSL=false&useUnicode=true&characterEncoding=utf-8";
    		String uname = "root";
    		String upassword = "movie199738M";
    		String AF=(String)session.getAttribute("AorF");
    		if (AF=="A") {
        		Connection con=DriverManager.getConnection(ur2,uname,upassword);
        		Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        		ResultSet rs=sql.executeQuery("SELECT * FROM article where ISBN = '"+logname+"'");
    	        if(rs.next()) {
    			    if(isLetterOrDigit) {
    				    String pic = "C:/Users/admin/eclipse-workspace/tushuguan/image/" + savedFileName;
    				    String rd = "UPDATE article SET pic = '"+pic+"' WHERE ISBN='"+logname+"'";
    				    Statement sqla=con.createStatement();
    				    sqla.executeUpdate(rd);
    				    rs.updateString(5,pic);
    				    int index=rs.getRow();
    				    rs.absolute(index);
    				    rs.updateRow();
    	    		    backNews=fileName+"成功上传"+rd;
    	    		    upFile.setFileName(fileName);
    	    		    upFile.setSavedFileName(savedFileName);
    	    		    upFile.setBackNews(backNews);
    			    }
    		    }
    		    con.close();
    		    f1.delete();
    		} else {
    		    Connection con=DriverManager.getConnection(uri,uname,upassword);
    		    Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    	    	ResultSet rs=sql.executeQuery("SELECT * FROM bookform where bookISBN = '"+logname+"'");
    		    if(rs.next()) {
    		    	if(isLetterOrDigit) {
    			    	String pic = "C:/Users/admin/eclipse-workspace/tushuguan/image/" + savedFileName;
    			    	String rd = "UPDATE bookform SET bookPic = '"+pic+"' WHERE bookISBN='"+logname+"'";
    			    	Statement sqla=con.createStatement();
    			    	sqla.executeUpdate(rd);
    			    	rs.updateString(1,pic);
    			    	int index=rs.getRow();
    			    	rs.absolute(index);
    			    	rs.updateRow();
    	    	    	backNews=fileName+"成功上传"+rd;
    	    	    	upFile.setFileName(fileName);
    	    	    	upFile.setSavedFileName(savedFileName);
    	    	    	upFile.setBackNews(backNews);
    			    }
    		    }
    		    con.close();
    		    f1.delete();
    		}
    	} catch(Exception exp) {
    		backNews=""+exp;
    		upFile.setBackNews(backNews);
    	}
    	try {
    		RequestDispatcher dispatcher=request.getRequestDispatcher("admin/showUploadMess.jsp");
    		dispatcher.forward(request, response);
    	} catch(Exception ee) {}
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)
    throws ServletException,IOException {
    	doPost(request,response);
    }
}
