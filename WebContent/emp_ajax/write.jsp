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
						<h5 class="card-title">직원등록</h5>

						<form class="form-horizontal" role="form" name="f" method="post" action="save.jsp">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for=num">직원 번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="num" name="num" placeholder="직원 번호를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">직원 이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name" name="name" placeholder="직원 이름을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="job">직책</label>
								<div class="col-sm-10">
									<input class="form-control" id="job" name="job" placeholder="직책을 입력해 주세요"></input>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">사수 번호</label>
								<div class="col-sm-10">
									<input class="form-control" id="mgr" name="mgr" placeholder="사수 번호를 입력해 주세요"></input>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="hiredate">고용일</label>
								<div class="col-sm-10">
									<input class="form-control" id="hiredate" name="hiredate" placeholder="고용일을 입력해 주세요"></input>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="sal">급여</label>
								<div class="col-sm-10">
									<input class="form-control" id="sal" name="sal" placeholder="급여를 입력해 주세요"></input>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="comm">상여금</label>
								<div class="col-sm-10">
									<input class="form-control" id="comm" name="comm" placeholder="상여금을 입력해 주세요  (없으면 생략 가능합니다.)"></input>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="d_num">부서 번호</label>
								<div class="col-sm-10">
									<input class="form-control" id="d_num" name="d_num" placeholder="부서 번호를 입력해 주세요"></input>
								</div>
							</div>
						</form>

						<div class="text-right">
							<a href="" id="saveEmp" class="btn btn-outline-primary">등록</a>
							<a href="list.jsp?page=<%=cPage%>" id="listEmp" class="btn btn-outline-success">취소</a>
						</div>
						<script>
							$(function(){
								$("#saveEmp").on("click",function(event){
									event.preventDefault();
									// 유효성 검사
									let num = $("#num").val();
									let name = $("#name").val();
									let job = $("#job").val();
									let mgr = $("#mgr").val();
									let hiredate = $("#hiredate").val();
									let sal = $("#sal").val();
									let comm = $("#comm").val();
									let dnum = $("#dnum").val();
									
									if(!num){
										alert("직원 번호를 입력해세주요.");
										$("#num").focus();
										return;
									} else if(!name){
										alert("직원 이름을 입력해세주요.");
										$("#name").focus();
										return;
									} else if(!job){
										alert("직책을 입력해세주요.");
										$("#job").focus();
										return;
									} else if(!mgr){
										alert("사수 번호를 입력해세주요.");
										$("#mgr").focus();
										return;
									} else if(!hiredate){
										alert("고용일을 입력해세주요.");
										$("#hiredate").focus();
										return;
									} else if(!sal){
										alert("급여를 입력해세주요.");
										$("#sal").focus();
										return;
									}  else if(!d_num){
										alert("부서 번호를 입력해세주요.");
										$("#d_num").focus();
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