<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/MVCBoard/style/write.css"
	rel="stylesheet" type="text/css" />
<script>
	function validateForm(form) { // 폼 내용 검증
		if (form.name.value == "") {
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>

	<form class="write-form" name="writeFrm" method="post" enctype="multipart/form-data" action="../mvcboard/edit.do" onsubmit="return validateForm(this);">
			<input type="hidden" name= 'idx' value="${ dto.idx }"/>
	      <input type="hidden" name= 'prevOfile' value="${ dto.ofile }"/>
	      <input type="hidden" name= 'prevSfile' value="${ dto.sfile }"/>
		<div class="write-form__group write-form__group-name">
			<label class="write-form__label" for="name">작성자</label>
			 <input
				class="write-form__input-name" type="text" id="name" name="name"
				value="${ dto.name }" />
		</div>
		<div class="write-form__group write-form__group-title">
			<label class="write-form__label" for="title">제목</label> 
			<input
				class="write-form__input" type="text" id="title" name="title"
				value="${ dto.title }" />
		</div>

		<div class="write-form__group write-form__group-content">
			<label class="write-form__label" for="content">내용</label>
			<textarea class="write-form__input-content" id="content"
				name="content">${ dto.content }</textarea>
		</div>
		<div class="mb-3">
			<input class="form-control" type="file" name="ofile">
		</div>

		<div class="write-form__actions">
			<button class="write-form__button btn btn-primary" type="submit">작성완료</button>
			<button class="write-form__button btn btn-secondary" type="reset">다시입력</button>
			<button class="write-form__button btn btn-secondary" type="button" onclick="location.href='../mvcboard/list.do';">목록 보기</button>
		</div>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
		crossorigin="anonymous"></script>
</body>
</html>