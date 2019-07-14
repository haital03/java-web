package myforms;

import mydatabase.DBOperations;
import org.apache.struts.action.ActionForm;

public class LoginForm extends ActionForm
{
    private String txtUsername, txtPassword;

    public String getTxtUsername() 
    {
        return txtUsername;
    }

    public void setTxtUsername(String txtUsername) 
    {
        this.txtUsername = txtUsername;
    }

    public String getTxtPassword() 
    {
        return txtPassword;
    }

    public void setTxtPassword(String txtPassword) 
    {
        this.txtPassword = txtPassword;
    }
    
    public boolean isVerified()
    {
        DBOperations dbObj = new DBOperations();
        return dbObj.verifyUser(txtUsername, txtPassword);
    }
}
