package mydatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class DBOperations 
{
    Connection con=null;
    private Session m_Session;
    private Message m_simpleMessage;
    private InternetAddress m_FROMAddress;
    private InternetAddress m_toAddress;
    private Properties m_properties;
    public DBOperations()
    {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:mysql://localhost/webthinkbits","root","hash1996");
            con = DriverManager.getConnection("jdbc:mysql://localhost/webthinkbits","root","system");
        }
        catch (ClassNotFoundException ex)
        {
            ex.printStackTrace();       
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
    }
    public int getUpvotes(long ansId)
    {
        int upvotes = 0;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT count(*) FROM myvote where voteType=? and ansId=?");
            pst.setString(1, "upvote");
            pst.setLong(2, ansId);
            ResultSet rst = pst.executeQuery();
            if(rst.next())
            {
                upvotes = rst.getInt(1);
            }
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
        }
        return upvotes;
    }
    public int getDownvotes(long ansId)
    {
        int downvotes = 0;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT count(*) FROM myvote where voteType=? and ansId = ?");
            pst.setString(1, "downvote");
            pst.setLong(2, ansId);
            ResultSet rst = pst.executeQuery();
            if(rst.next())
            {
                downvotes = rst.getInt(1);
            }
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
        }
        return downvotes;
    }
    public void vote(String voteType, long ansId,long createdUserId)
    {
        try
        {
            PreparedStatement pst1 = con.prepareStatement("SELECT * FROM myvote where ansId = ? and createdUserId = ?");
            pst1.setLong(1,ansId);
            pst1.setLong(2,createdUserId);
            ResultSet rst = pst1.executeQuery();
            if(rst.next())
            {
                PreparedStatement pst = con.prepareStatement("Update myvote set voteType = ? where ansId = ? and createdUserId = ?");
                pst.setString(1, voteType);
                pst.setLong(2,ansId);
                pst.setLong(3, createdUserId);
                pst.executeUpdate();
            }
            else
            {
                PreparedStatement pst = con.prepareStatement("Insert into myvote(voteType,ansId,createdUserId) "
                        + "values(?,?,?)");
                pst.setString(1, voteType);
                pst.setLong(2,ansId);
                pst.setLong(3, createdUserId);
                pst.executeUpdate();
            }
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
        }
    }
    
    public long getUserId(String username)
    {
        long userId = 0;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT userId FROM myusers where username=?");
            pst.setString(1, username);
            ResultSet rst = pst.executeQuery();
            while(rst.next())
            {
                userId = rst.getLong(1);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return userId;
    }
    public String getUsername(long userId)
    {
        String users_name = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT username FROM myusers where userId=?");
            pst.setLong(1, userId);
            ResultSet rst = pst.executeQuery();
            while(rst.next())
            {
                users_name = rst.getString(1);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return users_name;
    }
    public String getName(String name)
    {
        String users_name = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT name FROM myusers where username=?");
            pst.setString(1, name);
            ResultSet rst = pst.executeQuery();
            while(rst.next())
            {
                users_name = rst.getString(1);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return users_name;
    }
    public void createTables()
    {
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE database if not exists webthinkbits");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS myusers("
                    + "userId bigint primary key auto_increment,"
                    + "name varchar(30),"
                    + "email varchar(150),"
                    + "username varchar(50) unique,"
                    + "password varchar(50))");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS myques("
                    + "quesId bigint primary key auto_increment,"
                    + "ques text,"
                    + "quesFile text,"
                    + "createdOn timestamp default now(),"                    
                    + "createdUserId bigint)");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS myans("
                    + "ansId bigint primary key auto_increment,"
                    + "ans text,"
                    + "quesId bigint,"
                    + "ansFile text,"
                    + "createdOn timestamp default now(),"                    
                    + "createdUserId bigint,"
                    + "foreign key(quesId) references myques(quesId) )");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS mycomment("
                    + "commentId bigint primary key auto_increment,"
                    + "comment text,"
                    + "ansId bigint,"                  
                    + "createdUserId bigint,"
                    + "foreign key(ansId) references myans(ansId) )");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS myvote("
                    + "voteId bigint primary key auto_increment,"
                    + "voteType varchar(10),"
                    + "ansId bigint,"                  
                    + "createdUserId bigint,"
                    + "foreign key(ansId) references myans(ansId),"
                    + "CONSTRAINT ck_vote CHECK(voteType='upvote' OR voteType='downvote') )");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS samplepaper("
                    + "paperId bigint primary key auto_increment,"
                    + "paperFile text,"
                    + "paperdesc text,"
                    + "createdOn timestamp default now(),"                  
                    + "createdUserId bigint )");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS examupdates("
                    + "examId bigint primary key auto_increment,"
                    + "examName text,"
                    + "examDate text,"
                    + "examDesc text,"
                    + "examFile text,"
                    + "createdOn timestamp default now(),"                  
                    + "createdUserId bigint,"
                    + "examLink text )");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS mychat("
                    + "chatId bigint primary key auto_increment,"
                    + "sender varchar(50),"
                    + "message text,"
                    + "time text,"
                    + "date text,"                  
                    + "reciever varchar(50) )");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS notifications("
                    + "notificationId bigint primary key auto_increment,"
                    + "notification varchar(50),"
                    + "sender bigint,"
                    + "userId bigint,"
                    + "status varchar(20),"
                    + "timeSent timestamp default now() )");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS projects("
                    + "projectId bigint primary key auto_increment,"
                    + "projectFile text,"
                    + "projectDesc text,"
                    + "languageUsed text,"
                    + "createdOn timestamp default now(),"                  
                    + "createdBy bigint )");
            pst.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            PreparedStatement pst = con.prepareStatement("CREATE table IF NOT EXISTS sessionUser(username varchar(50),password varchar(50))");
            pst.execute();
        }catch(SQLException e){e.printStackTrace();}
    }
    public boolean postSamplePaper(String desc,long userId,String paperFile)
    {
            System.out.println("in postSamplePaper(): desc= " + desc);
        boolean flag = false;
        try
        {
            paperFile = paperFile.replaceAll("D:\\\\j2ee\\\\WebThinkBits\\\\web\\\\","");
            PreparedStatement pst = con.prepareStatement("Insert into samplepaper(paperdesc,createdUserId,paperFile)"
                    + " values(?,?,?)");
            System.out.println("postSamplePaper(): desc= " + desc);
            pst.setString(1, desc);
            pst.setLong(2, userId);
            if(paperFile!=null)
                pst.setString(3, paperFile);
            else
                pst.setString(3, null);
            int status = pst.executeUpdate();
            if(status>0)
                flag = true;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        } 
        return flag;
    }
    public ResultSet getSamplePapers()
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT paperId,paperdesc,paperFile,createdOn,createdUserId FROM samplepaper order by createdOn desc");
            rst = pst.executeQuery();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return rst;
    }
    
    public ResultSet getQuestions()
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT quesId,ques,quesFile,createdOn,createdUserId FROM myques order by createdOn desc");
            rst = pst.executeQuery();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return rst;
    }
    public boolean postQuestion(String ques,long userId,String quesFile)
    {
        boolean flag = false;
        try
        {
            quesFile = quesFile.replaceAll("D:\\\\j2ee\\\\WebThinkBits\\\\web\\\\","");
            PreparedStatement pst = con.prepareStatement("Insert into myques(ques,createdUserId,quesFile)"
                    + " values(?,?,?)");
            pst.setString(1, ques);
            pst.setLong(2, userId);
            if(quesFile!=null)
                pst.setString(3, quesFile);
            else
                pst.setString(3, null);
            int status = pst.executeUpdate();
            if(status>0)
                flag = true;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        } 
        return flag;
    }
    public ResultSet getAnswers(long quesId)
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT ansId,ans,ansFile,createdOn,createdUserId,"
                    + "((select count(*) FROM myvote v where v.ansId = a.ansId and voteType='upvote')"
                    + "-(select count(*) FROM myvote v where v.ansId = a.ansId and voteType='downvote')) votes "
                    + "FROM myans a where quesId = ? order by votes desc");
            pst.setLong(1, quesId);
            rst = pst.executeQuery();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return rst;
    }
    public boolean verifySessionUser(String username, String password)
    {
        boolean flag = true;
        try
        {
            PreparedStatement pst = con.prepareStatement("select * FROM sessionUser where username=? and password=?");
            pst.setString(1,username);
            pst.setString(2,password);
            ResultSet rst = pst.executeQuery();
            if(rst.next())
            {
                    flag = false;
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return flag;
    }
    public void insertSession(String username,String password)
    {
        try
        {
            PreparedStatement pst1 = con.prepareStatement("Insert into sessionUser values(?,?)");
            pst1.setString(1,username);
            pst1.setString(2, password);
            pst1.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void deleteSession(String username,String password)
    {
        try
        {
            PreparedStatement pst1 = con.prepareStatement("Delete FROM sessionUser where username=? and password=?");
            pst1.setString(1,username);
            pst1.setString(2, password);
            pst1.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public boolean postExamUpdate(String name,Date date,String desc,String file,String examLink,long userId)  //haita11
    {
        boolean flag = false;
        try
        {
            file = file.replaceAll("D:\\\\j2ee\\\\WebThinkBits\\\\web\\\\","");
            PreparedStatement pst = con.prepareStatement("Insert into examupdates("
                    + "examName,examDate,examDesc,examFile,examLink,createdUserId) values(?,?,?,?,?,?)");
            pst.setString(1, name);
            pst.setDate(2, new java.sql.Date(date.getTime()));
            pst.setString(3, desc);
            pst.setString(4, file);
            pst.setString(5, examLink);
            pst.setLong(6, userId);
            
            int status = pst.executeUpdate();
            if(status>0)
                flag = true;
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return flag;
    }
    public ResultSet getExamUpdates()
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT * FROM examupdates order by createdOn desc");
            rst = pst.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return rst;
    }
    public boolean postProjects(String file,String desc,String langUsed,long userId)
    {
        boolean flag = false;
        try
        {
            file = file.replaceAll("D:\\\\j2ee\\\\WebThinkBits\\\\web\\\\","");
            PreparedStatement pst = con.prepareStatement("Insert into projects("
                    + "projectFile,projectDesc,languageUsed,createdBy) values(?,?,?,?)");
            pst.setString(1, file);
            pst.setString(2, desc);
            pst.setString(3, langUsed);
            pst.setLong(4, userId);
            
            int status = pst.executeUpdate();
            if(status>0)
                flag = true;
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return flag;
    }
    public ResultSet getProjects()
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT * FROM projects order by createdOn desc");
            rst = pst.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return rst;
    }
    public boolean confirmEmail(String username,String email)
    {
        boolean flag = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT email FROM myusers where username = ?");
            pst.setString(1, username);
            ResultSet rst = pst.executeQuery();
            if(rst.next())
            {
                if(rst.getString(1).equals(email))
                {
                    flag = true;                   
                }
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return flag;
    }
    
    public boolean postAnswer(String ans,String ansFile,long quesId,long userId)
    {
        boolean flag = false;
        int status = 0;
        try
        {  
            ansFile = ansFile.replaceAll("D:\\\\j2ee\\\\WebThinkBits\\\\web\\\\","");
            PreparedStatement pst = con.prepareStatement("Insert into myans(ans,ansFile,quesId,createdUserId)"
                    + " values(?,?,?,?)");
            pst.setString(1, ans);
            if(ansFile!=null)
                pst.setString(2, ansFile);
            else
                pst.setString(2, null);
           // pst.setString(2,ansFile);
            pst.setLong(3, quesId);
            pst.setLong(4, userId);
            status = pst.executeUpdate();
            if(status>0)
                flag = true;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        } 
        return flag;
    }
     public ResultSet getComments(long ansId)
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT commentId,comment,createdUserId FROM mycomment where ansId = ?");
            pst.setLong(1, ansId);
            rst = pst.executeQuery();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return rst;
    }
     public int totalComments(long ansId)
     {
         int totalComments = 0;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT count(*) FROM mycomment where ansId=?");                    
            pst.setLong(1, ansId);
            ResultSet rst = pst.executeQuery();
            rst.next();
            totalComments = rst.getInt(1);
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        } 
        return totalComments;
     }
    public boolean postComment(String comment,long ansId,long userId)
    {
        boolean flag = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("Insert into mycomment(ansId,comment,createdUserId)"
                    + " values(?,?,?)");
            pst.setLong(1, ansId);
            pst.setString(2, comment);
            pst.setLong(3, userId);
            int status = pst.executeUpdate();
            if(status>0)
                flag = true;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        } 
        return flag;
    }
    public void deleteSessionUser(String username)
    {
         try
        {
            PreparedStatement pst = con.prepareStatement("Delete FROM sessionUser where username=?");
            pst.setString(1, username);
            pst.executeUpdate();
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
    }
    public boolean verifyUser(String username, String password)
    {
        boolean flag = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT * FROM myusers where username=? and password= BINARY ?");
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rst = pst.executeQuery();
            if(rst.next())
            {
                flag = true;
            }
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return flag;
    }
    public boolean insertUser(String name, String email, String username, String password)
    {
        boolean flag = false;
        try
        {
            PreparedStatement pst1 = con.prepareStatement("SELECT COUNT(*) FROM myusers where email = '"+email+"'");
            ResultSet rst = pst1.executeQuery();
            rst.next();
            String count = rst.getString(1);
            if(count.equals("0"))
            {
                PreparedStatement pst = con.prepareStatement("Insert into myusers(name,email,username,password) values(?,?,?,?)");
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, username);
                pst.setString(4, password);
                int status = pst.executeUpdate();
                if(status > 0)
                    flag = true;
            }
            else
            {
                //pop up -- username or email already exists
            }
            
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return flag;
    }
    public ResultSet selectUser(String username)
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT name,email,username,password FROM myusers where username = ?");
            pst.setString(1,username);
            rst = pst.executeQuery();
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return rst;
    }
    public boolean updateUser(String name,String email,String username,String password)
    {
        boolean flag = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("Update myusers set name=?,email=?,password=? where username=?");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.setString(4, username);
            int status = pst.executeUpdate();
            if(status > 0)
                flag = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return flag;
    }
    public boolean deleteUser(String username)
    {
        boolean flag = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("Delete FROM myusers where username = '"+username+"'");
            int status = pst.executeUpdate();
            if(status > 0)
                flag=true;
        } 
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        return flag;
    }
    public ResultSet viewAll()
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT * FROM myusers");
            rst = pst.executeQuery();
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return rst;
    }
    public String getPassword(String email)
    {
        String password = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT password FROM myusers where email=?");
            pst.setString(1, email);
            ResultSet rst = pst.executeQuery();
            if(rst.next())
                password = rst.getString(1);
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return password;
    }
    public void sendMail(String m_FROM, String m_to, String m_subject, String m_body) 
    {
        try 
        {
            m_properties = new Properties();
            m_properties.put("mail.smtp.host", "smtp.gmail.com");
            m_properties.put("mail.smtp.starttls.enable", "true");
            m_properties.put("mail.smtp.socketFactory.port", "465");
            m_properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            m_properties.put("mail.smtp.auth", "true");
            m_properties.put("mail.smtp.port", "465");

            m_Session = Session.getDefaultInstance(m_properties, new Authenticator() 
            {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() 
                {
                    return new PasswordAuthentication("thinkbits.adm1n@gmail.com", "");
                }
            });

            m_simpleMessage = new MimeMessage(m_Session);
            m_FROMAddress = new InternetAddress(m_FROM);
            m_toAddress = new InternetAddress(m_to);

            m_simpleMessage.setFrom(m_FROMAddress);
            m_simpleMessage.setRecipient(RecipientType.TO, m_toAddress);
            m_simpleMessage.setSubject(m_subject);
            m_simpleMessage.setContent(m_body, "text/html");

            Transport.send(m_simpleMessage);

        } 
        catch (MessagingException ex) 
        {
            ex.printStackTrace();
        }
    }
    public ResultSet fetchAllTextsOfThisUser(String sender,String reciever) 
    {
        ResultSet rst = null;
        try 
        {
            PreparedStatement pst = con.prepareStatement("select * FROM mychat where (sender=? and reciever=?) OR (sender=? and reciever=?)");
            pst.setString(1, sender);
            pst.setString(2, reciever);
            pst.setString(3, reciever);
            pst.setString(4, sender);
            rst = pst.executeQuery();
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
        return rst;
    }

    public boolean insertIntoMyChatThisText(String sender, String message, String time, String date, String reciever) 
    {
        boolean flag = false;
        try 
        {
            PreparedStatement pst = con.prepareStatement("insert into mychat(sender,message,time,date,reciever) values(?,?,?,?,?)");

            pst.setString(1, sender);
            pst.setString(2, message);
            pst.setString(3, time);
            pst.setString(4, date);
            pst.setString(5, reciever);
            int status = pst.executeUpdate();
            if (status > 0) 
            {
                flag = true;
            }
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
        return flag;
    }
    public boolean addNotif(String notif, long sender, long userId) 
    {
        boolean flag = false;
        try 
        {
            PreparedStatement pst = con.prepareStatement("insert into notifications(notification,sender,userId,status) values(?,?,?,?)");

            pst.setString(1, notif);
            pst.setLong(2, sender);
            pst.setLong(3, userId);
            pst.setString(4, "Not Seen");
            int status = pst.executeUpdate();
            if (status > 0) 
            {
                flag = true;
            }
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
        return flag;
    }
    public ResultSet getNotif(long userId)
    {
        ResultSet rst = null;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT * FROM notifications where userId =? and status=?");
            pst.setLong(1, userId);
            pst.setString(2,"Not Seen");
            rst = pst.executeQuery();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return rst;
    }
    public long whoPostedThisQues(long quesId)
    {
        long userId = 0;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT createdUserId FROM myques where quesId =?");
            pst.setLong(1, quesId);
            ResultSet rst = pst.executeQuery();
            if(rst.next())
                userId = rst.getLong(1);
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return userId;
    }
     public boolean deleteNotif(int notifId)
    {
        boolean flag = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("Delete FROM notifications where notificationId = "+notifId+" ");
            int status = pst.executeUpdate();
            if(status > 0)
                flag=true;
        } 
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        return flag;
    }
    public int countNotif(long userId)
    {
        int count = 0;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT count(*) FROM notifications where userId = "+userId+"");
            ResultSet rst = pst.executeQuery();
            if(rst.next())
                count=rst.getInt(1);
        } 
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        return count;
    }
    public int countChatNotif(long userId)
    {
        int count = 0;
        try
        {
            PreparedStatement pst = con.prepareStatement("SELECT count(*) FROM notifications where userId = "+userId+" and notification=?");
            pst.setString(1,"Your have been sent a text(s) by : ");
            ResultSet rst = pst.executeQuery();
            if(rst.next())
                count=rst.getInt(1);
        } 
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        return count;
    }
}