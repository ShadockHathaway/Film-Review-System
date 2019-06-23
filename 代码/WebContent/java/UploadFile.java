package mybean.data;
public class UploadFile {
  String fileName, savedFileName, backNews="";
  public void setFileName(String name) {
	  fileName=name;
  }
  public String getFileName() {
	  return fileName;
  }
  public void setSavedFileName(String name) {
	  savedFileName=name;
  }
  public String getSavedFileName() {
	  return savedFileName;
  }
  public String getBackNews() {
	  return backNews;
  }
  public void setBackNews(String s) {
	  backNews=s;
  }
}
