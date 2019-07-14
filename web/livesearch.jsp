<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mydatabase.DBOperations"%>

<%
    String[] cities = {"amritsar", "attari", "jalandhar", "ludhiana", 
        "patiala", "mohali", "roopnagar", "kapurthala", "hoshiarpur",
        "samrala", "goraya", "phagwara", "banga", "sultanpur lodhi",
        "moga", "barnala", "bathinda"};
    
   // String[] ques={};
    
    ArrayList<Integer> quesIdList = new ArrayList<>();    
    ArrayList<String> quesList = new ArrayList<>();    
    DBOperations dbObj = new DBOperations();
    ResultSet rst = dbObj.getQuestions();
    int quesIdforsearch = 0;
    while(rst.next())
    {
        quesIdforsearch = rst.getInt(1);
        String question = rst.getString(2);
        quesIdList.add(quesIdforsearch);
        quesList.add(question);
    }
    Integer[] qids = quesIdList.toArray(new Integer[0]);
    String[] ques = quesList.toArray(new String[0]);
    /*for(int i=0 ; i<ques.length ; i++)
    {
        System.out.println("Questions : "+ques[i]);
    }*/
%>
<%
    String userInputQues = request.getParameter("q");
    int counter = 0;
    for(int i=0 ; i<ques.length ; i++)
    {
        if(ques[i].startsWith(userInputQues))
        {
            counter++;
          //  out.println("<a id='"+qids[i]+"' href='services.jsp?quesId="+qids[i]+"'>"+ques[i]+"</a>");
           %>
            <a onclick="showQuesIdDiv(<%=qids[i]%>)" href="javascript:void(0);"><%=ques[i]%></a>
            <%
        }    
    }
    if(counter==0)
    {
        %>
        <a href="#">No Results Found</a>
        <%
    }
   /* String userInput = request.getParameter("q");
    for(int i=0 ; i<cities.length ; i++)
    {
        if(cities[i].startsWith(userInput))
        {
            out.println("<a href='fetchMoreDetails.jsp?city="+cities[i]+"'>"+cities[i]+"</a>");
        }
    }*/
    
%>