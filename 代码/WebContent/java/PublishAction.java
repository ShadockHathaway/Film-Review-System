package xiaoxiao.action;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.taglibs.standard.lang.jstl.test.PageContextImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PublishAction extends ActionSupport{
  private String category;
  private String title;
  private String content;
  public String getCategory(){
      return category;
  }
  public void setCategory(String category){
      this.category = category;
  }
  public String getTitle(){
      return title;
  }
  public void setTitle(String title){
      this.title = title;
  }
  public String getContent(){
      return content;
  }
  public void setContent(String content){
      this.content = content;
  }

@Override
public String execute() throws Exception {
    ActionContext cxt=ActionContext.getContext();
    Map request=(Map)cxt.get("request");
    request.put("category", category);
    request.put("title", title);
    request.put("content", content);
    return SUCCESS;
}
}