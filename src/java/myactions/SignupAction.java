package myactions;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myforms.SignupForm;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class SignupAction extends Action
{
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        SignupForm signupForm = (SignupForm)form;        
        if(signupForm.isRegistered())
        {
            PrintWriter pw = response.getWriter();
           // pw.print("SIGN UP SUCCESSFUL!!");   //how to show and then after few seconds redorect it?
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Sign Up sucessful!!');");
            pw.println("location='signup.jsp';");
            pw.println("</script>");
            Thread.sleep(1000);                 //send email too 
            return mapping.findForward("index");
        }
        else
        {
            PrintWriter pw = response.getWriter();
          //  pw.print("Something Went Wrong. Try again!!");
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Something went wrong. Try again!!');");
            pw.println("location='signup.jsp';");
            pw.println("</script>");
            Thread.sleep(1000);
            return mapping.findForward("failure");
        }
    }    
}