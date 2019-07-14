package myforms;

import mydatabase.DBOperations;
import org.apache.struts.action.ActionForm;

public class SignupForm extends ActionForm
{
    private String txtName, txtEmail, txtUsername, txtPassword, txtPasswordRepeat;

    public String getTxtName() 
    {
        return txtName;
    }

    public void setTxtName(String txtName) 
    {
        this.txtName = txtName;
    }

    public String getTxtEmail() 
    {
        return txtEmail;
    }

    public void setTxtEmail(String txtEmail) 
    {
        this.txtEmail = txtEmail;
    }

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

    public String getTxtPasswordRepeat() 
    {
        return txtPasswordRepeat;
    }

    public void setTxtPasswordRepeat(String txtPasswordRepeat) 
    {
        this.txtPasswordRepeat = txtPasswordRepeat;
    }
    public boolean isRegistered()
    {
        DBOperations dbObj = new DBOperations();
        return dbObj.insertUser(txtName, txtEmail, txtUsername, txtPassword);
    }
}