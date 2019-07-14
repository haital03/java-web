package myforms;

import javax.servlet.http.HttpSession;
import mydatabase.DBOperations;
import org.apache.struts.action.ActionForm;

public class PostCommentForm extends ActionForm
{
    private String txtPostComment;
    private long txtCommentId;

    public String getTxtPostComment() 
    {
        return txtPostComment;
    }

    public void setTxtPostComment(String txtPostComment) 
    {
        this.txtPostComment = txtPostComment;
    }

    public long getTxtCommentId() 
    {
        return txtCommentId;
    }

    public void setTxtCommentId(long txtCommentId) 
    {
        this.txtCommentId = txtCommentId;
    }
    public boolean isPosted(HttpSession session)
    {
        long userId = (long)session.getAttribute("userId");
        DBOperations dbObj = new DBOperations();
        return dbObj.postComment(txtPostComment, txtCommentId, userId);
    }
    
    
}