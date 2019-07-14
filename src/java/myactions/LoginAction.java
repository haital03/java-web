package myactions;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mydatabase.DBOperations;
import myforms.LoginForm;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LoginAction extends Action
{
    int i=1;
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        LoginForm loginForm = (LoginForm)form;
        if(loginForm.isVerified())
        {
            HttpSession session = request.getSession();
            session.setAttribute("username", loginForm.getTxtUsername()); 
            
    //getting userId and users_name as session attribute for using further
            DBOperations dbObj = new DBOperations();
            session.setAttribute("userId", dbObj.getUserId(loginForm.getTxtUsername()));
            
            session.setAttribute("users_name", dbObj.getName(loginForm.getTxtUsername()));
            
            if(dbObj.verifySessionUser(loginForm.getTxtUsername(), loginForm.getTxtPassword()))
            {
                dbObj.insertSession(loginForm.getTxtUsername(), loginForm.getTxtPassword());                
            }
            session.setAttribute("LoginSuccessful", true);
            session.setAttribute("sessionUsername", loginForm.getTxtUsername());
            session.setAttribute("sessionPassword", loginForm.getTxtPassword()); 
            
            return mapping.findForward("services");
        }
        else
        {
            PrintWriter pw = response.getWriter();
           // pw.print("LOGIN UNSUCCESSFUL!!");   //how to show and then after few seconds redorect it?
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Login Unsucessful!!');");
            pw.println("location='login.jsp';");
            pw.println("</script>");
            return mapping.findForward("failure");
        }
    }
    
}
