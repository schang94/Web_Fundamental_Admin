<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
<%
	if(memberDto != null){
	
%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Notice</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">공지사항</h5>

						<form class="form-horizontal" role="form" name="f" method="post" action="save.jsp">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for=writer">작성자</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="writer" name="writer" placeholder="이름을 입력해 주세요" value="<%=memberDto.getId()%>" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="title">제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="content">내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="content" name="content" placeholder="내용을 입력해 주세요" rows="10"></textarea>
								</div>
							</div>

						</form>

						<div class="text-right">
							<a href="http://www.naver.com" id="saveNotice" class="btn btn-outline-primary">등록</a>
							<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
						<script>
							$(function(){
								$("#saveNotice").on("click",function(event){
									event.preventDefault();
									// 유효성 검사
									let writer = $("#writer").val();
									let title = $("#title").val();
									let content = $("#content").val();
									
									if(!writer){
										alert("작성자을 입력해세주요.");
										$("#writer").focus();
										return;
									} else if(!title){
										alert("제목을 입력해세주요.");
										$("#title").focus();
										return;
									} else if(!content){
										alert("내용을 입력해세주요.");
										$("#content").focus();
										return;
									}
									
									f.submit();
								});
								
							});
						</script>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%} else { %>
		<script>
			 alert('로그인 사용자만 등록 가능합니다.');
			 location.href='list.jsp';
		</script>
	<%} %>
	<%@ include file = "../inc/footer.jsp" %>