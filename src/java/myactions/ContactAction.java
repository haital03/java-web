package myactions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mydatabase.DBOperations;
import myforms.ContactForm;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ContactAction extends Action
{
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        ContactForm contactForm = (ContactForm)form;
        if(contactForm != null)
        {
            DBOperations dbObj = new DBOperations();
            String senderEmail = "thinkbits.adm1n@gmail.com";
            String recieverEmail = "thinkbits.adm1n@gmail.com";
            String subject = "Message By : "+contactForm.getTxtName();
            String body="Contact : <b>"+contactForm.getTxtEmail()+"</b> to reply.\n\n"+contactForm.getTxtSubject(); 
            dbObj.sendMail(senderEmail, recieverEmail, subject, body);
            return mapping.findForward("success");
        }
        else
        {
            return mapping.findForward("failure");
        }
    }    
}
