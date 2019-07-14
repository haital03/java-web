package myforms;

import mydatabase.DBOperations;
import org.apache.struts.action.ActionForm;

public class ForgotPasswordForm extends ActionForm
{
    private String txtConfirmEmail;
    private String txtUsername;

    public String getTxtConfirmEmail() 
    {
        return txtConfirmEmail;
    }

    public void setTxtConfirmEmail(String txtConfirmEmail) 
    {
        this.txtConfirmEmail = txtConfirmEmail;
    }

    public String getTxtUsername() 
    {
        return txtUsername;
    }

    public void setTxtUsername(String txtUsername) 
    {
        this.txtUsername = txtUsername;
    }
    public String isConfirmedEmail()
    {
        String email = null;
        DBOperations dbObj = new DBOperations();
        if(dbObj.confirmEmail(txtUsername, txtConfirmEmail))
        {
            email = txtConfirmEmail;
        }
        return email;
    } 
}
