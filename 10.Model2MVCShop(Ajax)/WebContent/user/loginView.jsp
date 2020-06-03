<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>


</head>
		<meta charset="EUC-KR">
		<title>회원 목록 조회</title>
		
		<link rel="stylesheet" href="/css/admin.css" type="text/css">
		
		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
		
			function fncGetUserList(currentPage)  {
				$("#currentPage").val(currentPage)
				$("form").attr("method", "POST").attr("action" , "/user/listUser").submit();
			}//end function
			
			  $(function() {
				 
				  $( "td.ct_btn01:contains('검색')").on("click", function(){
					  
				  	fncGetUserList(1);
				  });
				  
				  $( ".ct_list_pop td:nth-child(3)" ).on("click", function(){
					  
				  		var userId = $(this).text().trim();
				  		$.ajax({
				  					url : "/user/json/getUser/"+userId	,
				  					method : "GET" ,
				  					dataType : "json"	,
				  					headers : {
				  						"Accept"  :  "application/json",
				  						"Content-Type"  :  "application/json"
				  						
				  					},
				  					success : function(JSONData , status){
				  						
				  						alert(status);
				  						
				  						alert("JSONData : \n"+JSONData);
				  						
				  						var displayValue = "<h3>"
				  													+"아이디 : "+JSONData.userId+"<br/>"
				  													+"이   름 : "+JSONData.userName+"<br/>"
				  													+"이메일 :  "+JSONData.email+"<br/>"
				  													+"ROLE : "+JSONData.role+"<br/>"
				  													+"등록일 : "+JSONData.regDate+"<br/>"
				  													+"</h3>";
				  													
				  						$("h3").remove();
				  						$(	"#"+userId+"" ).html(displayValue);
				  					}
				  					
				  				});
				  
				  });
				  
				  $(  ".ct_list_pop td:nth-child(3)"   ).css("color", "red");
				  $("h7").css("color", "red");
				  
				  $(".ct_list_pop : nth-child(4n+6)" ).css("background-color", "whitesmoke");
			  });
			
		
		
		
		</script>
<body bgcolor="#ffffff" text="#000000" >

<form>

<div align="center" >

<TABLE WITH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD ALIGN="CENTER" VALIGN="MIDDLE">

<table width="650" height="390" border="5" cellpadding="0" cellspacing="0" bordercolor="#D6CDB7">
  <tr> 
    <td width="10" height="5" align="left" valign="top" bordercolor="#D6CDB7">
    	<table width="650" height="390" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="305">
            <img src="/images/logo-spring.png" width="305" height="390"/>
          </td>
          <td width="345" align="left" valign="top" background="/images/login02.gif">
          	<table width="100%" height="220" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="30" height="100">&nbsp;</td>
                <td width="100" height="100">&nbsp;</td>
                <td height="100">&nbsp;</td>
                <td width="20" height="100">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="50">&nbsp;</td>
                <td width="100" height="50">
                	<img src="/images/text_login.gif" width="91" height="32"/>
                </td>
                <td height="50">&nbsp;</td>
                <td width="20" height="50">&nbsp;</td>
              </tr>
              <tr> 
                <td width="200" height="50" colspan="4"></td>
              </tr>              
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_id.gif" width="100" height="30"/>
                </td>
                <td height="30">
                  <input 	type="text" name="userId"  id="userId"  class="ct_input_g" 
                  				style="width:180px; height:19px"  maxLength='50'/>          
          		</td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_pas.gif" width="100" height="30"/>
                </td>
                <td height="30">                    
                    <input 	type="password" name="password" class="ct_input_g" 
                    				style="width:180px; height:19px"  maxLength="50" />
                </td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="20">&nbsp;</td>
                <td width="100" height="20">&nbsp;</td>
                <td height="20" align="center">
   				    <table width="136" height="20" border="0" cellpadding="0" cellspacing="0">
                       <tr> 
                         <td width="56">
                         		<img src="/images/btn_login.gif" width="56" height="20" border="0"/>
                         </td>
                         <td width="10">&nbsp;</td>
                         <td width="70">
                       			<img src="/images/btn_add.gif" width="70" height="20" border="0">
                         </td>
                       </tr>
                     </table>
                 </td>
                 <td width="20" height="20">&nbsp;</td>
                </tr>
              </table>
            </td>
      	</tr>                            
      </table>
      </td>
  </tr>
</table>
</TD>
</TR>
</TABLE>

</div>

</form>

</body>

</html>