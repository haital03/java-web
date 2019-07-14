<%@page import="mydatabase.DBOperations"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
    String desc = "";
    File file = null;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;

    String filePath = "D:\\j2ee\\WebThinkBits\\web\\samplepapers\\";

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
                
                if (fi.isFormField()) 
                {
                    String fieldName = fi.getFieldName();
                    String fieldValue = fi.getString();
                    if ("txtDesc".equals(fieldName)) 
                    {
                        desc = fieldValue;
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
                            fi.write(file);
                    }
                }
            }
                    try 
                    {
                        String sendFile = null;
                        long userId = (long) session.getAttribute("userId");
                        DBOperations dbObj = new DBOperations();
                        if(file!=null)  //haital
                            sendFile = file.getAbsolutePath();
                        boolean n = dbObj.postSamplePaper(desc, userId, sendFile);
                        if (n == true) 
                        {
                            response.sendRedirect("newsamplepaper.jsp");
                        } 
                        else 
                        {                            
                            response.sendRedirect("failure.jsp");
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
