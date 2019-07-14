package myforms;

import javax.servlet.http.HttpSession;
import mydatabase.DBOperations;
import org.apache.struts.action.ActionForm;

public class UpdateForm extends ActionForm
{
    private String txtName, txtEmail, txtUsername, txtPassword;

    public String getTxtName() {
        return txtName;
    }

    public void setTxtName(String txtName) {
        this.txtName = txtName;
    }

    public String getTxtEmail() {
        return txtEmail;
    }

    public void setTxtEmail(String txtEmail) {
        this.txtEmail = txtEmail;
    }

    public String getTxtUsername() {
        return txtUsername;
    }

    public void setTxtUsername(String txtUsername) {
        this.txtUsername = txtUsername;
    }

    public String getTxtPassword() {
        return txtPassword;
    }

    public void setTxtPassword(String txtPassword) {
        this.txtPassword = txtPassword;
    }
    
    public boolean isUpdated(HttpSession session)
    {
        DBOperations dbObj = new DBOperations();
        return dbObj.updateUser(txtName, txtEmail, (String)session.getAttribute("username"), txtPassword);
    }
}
