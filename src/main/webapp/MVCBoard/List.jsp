<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/MVCBoard/style/list.css" rel="stylesheet" type="text/css"/>
<script>
	
</script>
</head>
<body>
	<div class= "page-container">
		<header class="page-header">
			<h2 class= "header">MVCBoard 게시판</h2>
		</header>
		
		<main>
			
			<table class= "table table-hover" border="1" width="90%">
				<caption class= "table__caption">파일 첨부형 게시판- 현재 페이지: ${ map.pageNum }</caption>
				<thead class= "table-light">
					<tr>
						<th width="10%">번호</th>
						<th width="*">제목</th>
						<th width="15%">작성자</th>
						<th width="10%">조회수</th>
						<th width="15%">작성일</th>
						<th width="8%">첨부</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ empty boardLists }">
							<tr>
								<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${ boardLists }" var="row" varStatus="loop">
								<tr align="center">
									<td>${ map.totalCount- (((map.pageNum -1) * map.pageSize)+ loop.index) }</td>
			
									<td align="left"><a href="../mvcboard/view.do?idx=${ row.idx }">${ row.title }</a></td>
									<td>${ row.name }</td>
									<td>${ row.visitcount }</td>
									<td>${ row.postdate }</td>
									<td><c:if test="${ not empty row.ofile }">
											<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a>
										</c:if></td>
								</tr>
			
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class= "paging">
				${ map.pagingImg }
				<button type="button" class= "btn btn-secondary"onclick="location.href= '../mvcboard/write.do;'">글쓰기</button>
			</div>
			<form class= "search-form" method="get">
				<select class= "search-form__select" name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select>
				 <input type="text" placeholder= "검색어를 입력하세요" class="search-form__input" name="searchWord" /> 
				 <input type="submit"  class="search-form__button" value="검색" />
			</form>
		</main>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>