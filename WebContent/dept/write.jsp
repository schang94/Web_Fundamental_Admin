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
								<label class="col-form-label col-sm-2" for=num">부서 번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="num" name="num" placeholder="부서 번호를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">부서 이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name" name="name" placeholder="부서 이름을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="loc">내용</label>
								<div class="col-sm-10">
									<input class="form-control" id="loc" name="loc" placeholder="부서 지역을 입력해 주세요"></input>
								</div>
							</div>

						</form>

						<div class="text-right">
							<a href="" id="saveDept" class="btn btn-outline-primary">등록</a>
							<a href="list.jsp?page=<%=cPage %>" id="listDept" class="btn btn-outline-success">취소</a>
						</div>
						<script>
							$(function(){
								$("#saveDept").on("click",function(event){
									event.preventDefault();
									// 유효성 검사
									let num = $("#num").val();
									let name = $("#name").val();
									let loc = $("#loc").val();
									
									if(!num){
										alert("부서 번호을 입력해세주요.");
										$("#num").focus();
										return;
									} else if(!name){
										alert("부서 이름을 입력해세주요.");
										$("#name").focus();
										return;
									} else if(!loc){
										alert("부서 지역을 입력해세주요.");
										$("#loc").focus();
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
	<%@ include file = "../inc/footer.jsp" %>