<%
    if(session != null){
        if(session.getAttribute("useradmin")!=null ){
            
        } else{
            response.sendRedirect("/computerlabs/?option=login");
            return;
        }
        
    }else{
        response.sendRedirect("/computerlabs/?option=login");
        return;
    }
    
%>