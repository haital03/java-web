package myactions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myforms.UpdateForm;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UpdateAction extends Action
{
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        UpdateForm updateform = (UpdateForm)form;
        if(updateform.isUpdated(request.getSession()))
        {
            return mapping.findForward("services");
        }
        else
        {
            return mapping.findForward("failure");
        }
    }    
}
