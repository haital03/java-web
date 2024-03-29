package myactions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import myforms.PostCommentForm;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class PostCommentAction extends Action
{
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        PostCommentForm commentForm = (PostCommentForm)form;
        HttpSession session = request.getSession();
        if(commentForm.isPosted(session))
        {
            return mapping.findForward("services");
        }
        else
        {
            return mapping.findForward("services");
        }
    }
}
