<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mydatabase.DBOperations"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
    String examName = "",examDate="",examDesc="",examLink="";
    Date dateObj = null;
    File file = null;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;

    String filePath = "D:\\j2ee\\WebThinkBits\\web\\examupdates\\";

        // Verify the content type
    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) 
    {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File("C:\\Temp"));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(maxFileSize);
        try 
        {
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();

            while (i.hasNext()) 
            {
                FileItem fi = (FileItem) i.next();
                System.out.println("FileItem: " + fi);
                
                if (fi.isFormField()) 
                {
                    String fieldName = fi.getFieldName();
                    String fieldValue = fi.getString();
                    System.out.println(fieldName + " : " + fieldValue);
                    if ("txtExamName".equals(fieldName)) 
                    {
                        examName = fieldValue;
                    }
                    if ("txtExamDate".equals(fieldName)) 
                    {
                        examDate = fieldValue;
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        try 
                        {
                            dateObj = sdf.parse(examDate);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                    }
                    if ("txtDesc".equals(fieldName)) 
                    {
                        examDesc = fieldValue;
                    }
                    if ("txtExamLink".equals(fieldName)) 
                    {
                        examLink = fieldValue;
                    }
                }
                if (!fi.isFormField()) 
                {
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    if(fileName != null)
                    {             // Write the file
                        if (fileName.lastIndexOf("\\") >= 0) 
                        {
                            file = new File(filePath
                                    + fileName.substring(fileName.lastIndexOf("\\")));
                        } 
                        else 
                        {
                            file = new File(filePath
                                    + fileName.substring(fileName.lastIndexOf("\\") + 1));
                        }
                        if(fileName != "")
                        {
                            fi.write(file);
                        }                            
                    }
                }
            }    
                    try 
                    {
                        String sendFile="";
                        long userId = (long) session.getAttribute("userId");
                        DBOperations dbObj = new DBOperations();
                        if(file!=null)  //haital
                            sendFile = file.getAbsolutePath();
                         System.out.println("Haiital SHarnma"+examName+","+dateObj+","+examDesc+","+sendFile+","+userId+","+examLink);
                        
                        boolean n = dbObj.postExamUpdate(examName, dateObj, examDesc, sendFile,examLink, userId);
                        if (n == true) 
                        {
                            response.sendRedirect("examupdates.jsp");
                        } 
                        else 
                        {                            
                            response.sendRedirect("examupdates.jsp");
                        }
                    } 
                    catch (Exception ex) 
                    {
                        System.err.println(ex);
                        out.println(ex);
                    }
            } 
            catch (Exception ex) 
            {
                System.out.println(ex);
            }
    }
%>                                                      