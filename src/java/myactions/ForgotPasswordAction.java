package myactions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mydatabase.DBOperations;
import myforms.ForgotPasswordForm;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ForgotPasswordAction extends Action
{
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        ForgotPasswordForm forgotForm = (ForgotPasswordForm)form;
        String email = forgotForm.isConfirmedEmail();
        if(email != null)
        {
            DBOperations dbObj = new DBOperations();
            String senderEmail = "thinkbits.adm1n@gmail.com";
            String recieverEmail = email;
            String password = dbObj.getPassword(email);
            String subject = "Password Recovery Email";
            String body="Hello User,\n This is with regard to your forgot password request."
                    + "<b>Your password is : <u>"+password+" </u></b>. \n Update your password as "
                    + "soon as you get this for security reasons."; 
            dbObj.sendMail(senderEmail, recieverEmail, subject, body);
            return mapping.findForward("success");
        }
        else
        {
            return mapping.findForward("failure");
        }
    }    
}
