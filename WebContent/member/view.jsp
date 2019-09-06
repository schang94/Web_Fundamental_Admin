<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage =0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}
	
	try{
		cPage = Integer.parseInt(tempPage);
	} catch(NumberFormatException e){
		cPage = 1;
	}
%>
<%
	String tempseq = request.getParameter("seq");
	int seq =0;
	try{
		seq = Integer.parseInt(tempseq);
	} catch(NumberFormatException e){
		seq = 0;
	}
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.select(seq);
	if(dto != null) {
		String id = dto.getId();
		String email = dto.getEmail();
		String name = dto.getName();
		String phone = dto.getPhone();
		
%>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="/">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Member</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">회원정보</h5>
            <form class="form-horizontal" role="form" name="f" method="post" action="">
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요" value="<%=name%>">
              </div>
              <div class="form-group">
                <label class="col-form-label" for="id">아이디</label>
                <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요" value="<%=id%>">
              </div>
              <div class="form-group">
                <label for="email">이메일 주소</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일 주소를 입력해주세요" value="<%=email%>">
              </div>
              <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <input type="tel" class="form-control" name="phone" id="phone" placeholder="휴대폰번호를 입력해 주세요" value="<%=phone%>">
              </div>
              <%--
              <div class="form-group text-center">
                <a href="" id="join-submit" class="btn btn-primary">
                  회원수정<i class="fa fa-check spaceLeft"></i>
                </a>
                <a href="list.jsp" class="btn btn-warning">
                  회원목록<i class="fa fa-times spaceLeft"></i>
                </a>
              </div>
               --%>
               <input type="hidden" name="seq" value="<%=seq%>"/>
               <input type="hidden" name="page" value="<%=cPage%>"/>
            </form>
            <div class="text-right">
				<a href="" id="modifyMember" class="btn btn-outline-primary">수정</a>
				<a href="" id="deleteMember" class="btn btn-outline-danger">삭제</a>
				<a href="list.jsp?page=<%=cPage %>" id="listEmp" class="btn btn-outline-success">리스트</a>
			</div>
			<script>
				$(function(){
					$("#modifyMember").on("click",function(event){
						event.preventDefault();
						f.action = "modify.jsp";
						f.submit();
					});
					$("#deleteMember").on("click",function(event){
						event.preventDefault();
						if(confirm('정말로 삭제 하시겠습니까?')){
							f.action = "delete.jsp";
							f.submit();
						}	
					});
				});
			</script>
          </div>
        </div>
      </div>

    </div>
  </div>
  <%@ include file = "../inc/footer.jsp" %>
  
  <%} else {%>
  	<script>
  		alert("회원정보가 없습니다.");
  		history.back(-1);
  	</script>
  <%}%>