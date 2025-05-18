<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/MVCBoard/style/view.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<header>
		<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>
	</header>
	<main>
		<div class="board-view">
			<div class="view-header">
				<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>
			</div>

			<div class="view-body">
				<div class="view-row view-row--four-col">
					<div class="view-label">번호</div>
					<div class="view-value">${ dto.idx }</div>
					<div class="view-label">작성자</div>
					<div class="view-value">${ dto.name }</div>
				</div>
				
				<div class="view-row view-row--four-col">
					<div class="view-label">작성일</div>
					<div class="view-value">${ dto.postdate }</div>
					<div class="view-label">조회수</div>
					<div class="view-value">${ dto.visitcount }</div>
				</div>

		
				<div class="view-row">
					<div class="view-label">제목</div>
					<div class="view-value">${ dto.title }</div>
				</div>

			
				<div class="view-row">
					<div class="view-label">내용</div>
					<div class="view-value view-value--content">
						${ dto.content }
						<c:if test="${ not empty dto.ofile and isImage eq true }">
							<br>
							<img src="../Uploads/${ dto.sfile }" alt="첨부 이미지" />
						</c:if>
					</div>
				</div>

				
				<div class="view-row view-row--file-info">
					<div class="view-label">첨부파일</div>
					<div class="view-value view-value--file">
						<c:if test="${ not empty dto.ofile }">
							${ dto.ofile }
							<a href="../mvcboard/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${dto.idx}">
								[다운로드]
							</a>
						</c:if>
						<c:if test="${ empty dto.ofile }">
							첨부파일 없음
						</c:if>
					</div>
					<div class="view-label">다운로드수</div>
					<div class="view-value view-value--download">${ dto.downcount }</div>
				</div>

			</div>
			
			<div class="view-actions">
				<button type="button" onclick="location.href= '../mvcboard/pass.do?mode=edit&idx=${ param.idx }';">
					수정하기
				</button>
				<button type="button" onclick="location.href= '../mvcboard/pass.do?mode=delete&idx=${ param.idx }';">
					삭제하기
				</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">
					목록 바로가기
				</button>
			</div>

		</div>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>
