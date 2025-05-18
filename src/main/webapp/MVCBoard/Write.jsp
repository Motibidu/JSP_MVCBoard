<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/MVCBoard/style/write.css" rel="stylesheet" type="text/css"/>
<script>
	function validateForm(form) {
		if (form.name.value == "") 
		{
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
		if (form.title.value == "") 
		{
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") 
		{
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
		if (form.pass.value == "") 
		{
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
	}
	
</script>
</head>
<body>
	<div class="page-container">
		<header  class="header">
			<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>
		</header>
		<main>
			<form class="write-form" name="writeFrm" method="post" enctype="multipart/form-data" action="../mvcboard/write.do" onsubmit="return validateForm(this);">
			
			    <div class="write-form__group write-form__group-name">
			        <label class="write-form__label" for="name">작성자</label>
			        <input class="write-form__input-name" type="text" id="name" name="name" />
			    </div>
			    
			    <div class="write-form__group write-form__group-pwd">
			        <label class="write-form__label" for="pass">비밀번호</label>
			        <input class="write-form__input-pwd" type="password" id="pass" name="pass" />
			    </div>
			
			    <div class="write-form__group write-form__group-title">
			        <label class="write-form__label" for="title">제목</label>
			        <input class="write-form__input" type="text" id="title" name="title" />
			    </div>
			
			    <div class="write-form__group write-form__group-content">
			        <label class="write-form__label" for="content">내용</label>
			        <textarea class="write-form__input-content" id="content" name="content"></textarea>
			    </div>
				<div class="mb-3">
				  <input class="form-control" type="file" name= "ofile">
				</div>
			
			    
			
			    <div class="write-form__actions">
			        <button class="write-form__button btn btn-primary" type="submit">작성 완료</button>
			        <button class="write-form__button btn btn-secondary" type="reset">다시 입력</button>
			        <button class="write-form__button btn btn-secondary" type="button" onclick="location.href='../mvcboard/list.do';">
			            목록 보기</button>
			    </div>
		
			</form>
		</main>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>