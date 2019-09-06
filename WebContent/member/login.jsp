<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Login</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
          	<% if(memberDto == null) { %>
            <h5 class="card-title">로그인</h5>
            <form name="f" method="post" action="check_login.jsp">
              <div class="form-group">
                <input id="email" name="email" type="text" class="form-control" placeholder="Your Email *" value="" />
                <div id="emailMessage"></div>
              </div>
              <div class="form-group">
                <input id="pwd" name="pwd" type="password" class="form-control" placeholder="Your Password *" value="" />
                <div id="pwdMessage"></div>
              </div>
              <div class="form-group">
                <input id="Checklogin" type="submit" class="btn btn-primary" value="Login" />
              </div>
              <div class="form-group">
                <a href="#" class="ForgetPwd">Forget Password?</a>
              </div>
              <input type="hidden" name="checkEmail" id="checkId" value="no"/>
            </form>
          </div>
          <script>
          	$(function(){
          		let regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
          		$("#Checklogin").on("click",function(event){
          			event.preventDefault();
          			if($("#email").val().length==0){
          				$("#emailMessage").html('<span class="text-danger">이메일을 입력하시오.</span>');
          				$("#email").addClass("is-invalid");         				
          				$("#email").focus();
          				return;
          			} else{
          				$("#email").removeClass("is-invalid");
          				$("#emailMessage").html('');
          			}
          			
          			if($("#pwd").val().length==0){
          				$("#pwdMessage").html('<span class="text-danger">비밀번호를 입력하시오.</span>')
          				$("#pwd").addClass("is-invalid");
          				$("#pwd").focus();
          				return;
          			} else{
          				$("#pwd").removeClass("is-invalid");
          				$("#pwdMessage").html('');
          			}
          			if($("#checkEmail").val()=="no"){
          				//return;
          			}
          			
          			f.submit();
          		});
          		
          		$("#email").on("keyup",function(){
					$('#emailMessage').html('');
					$("#email").removeClass("is-invalid");
          			if(regEmail.test($("#email").val()) == true){
          				$("#emailMessage").html('<span class="text-success">올바른 이메일 형식입니다.</span>')
          				$("#checkEmail").val("yes");
          			} else{
          				$("#checkEmail").val("no");
          			}
          		});
          	}); // enf of load event
          </script>
          <% } else { %>
          			<h5 class="card-title">로그인하셨습니다</h5>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <%@ include file = "../inc/footer.jsp" %>