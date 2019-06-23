package tom.jiafei;
import java.io.*;
public class WriteFile {
  String filePath="",
		  fileName="",
		  fileContent="";
  public void setFilePath(String s) {
	  filePath=s;
  }
  public String getFilePath() {
	  return filePath;
  }
  public void setFileName(String s) {
	  fileName=s;
  }
  public String getFileName() {
	  return fileName;
  }
  public void setFileContent(String s) {
	  fileContent=s;
      if (fileName.length()>0&&filePath.length()>0) {
	      try {
		      File file=new File(filePath,fileName);
		      OutputStreamWriter oStreamWriter = new OutputStreamWriter(new FileOutputStream(file), "utf-8");
		      oStreamWriter.append(s);
		      oStreamWriter.close();
	      }
	      catch(Exception e) {}
      }
  }
  public String getFileContent() {
	  return fileContent;
  }
}
