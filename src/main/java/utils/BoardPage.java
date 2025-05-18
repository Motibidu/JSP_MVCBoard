package utils;

public class BoardPage
{
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl)
	{
		// totalCount: 총 게시물 개수
		// pageSize: 한 페이지에 게시물 개수
		// blockPage: 페이지를 몇 개 단위로 보여줄지
		// pageNum: 현재 페이지 번호
		String pagingStr = "";

		// 총 페이지 개수
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));

		// pageTemp: 이전 블록 넘어갈 때 사용할 페이지번호
		//           현재 페이지 번호가 5를 넘어갔는지 조건확인
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		if (pageTemp != 1)
		{
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>[이전 블록]</a>";
		}

		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages)
		{
			if (pageTemp == pageNum)
			{
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			} 
			else
			{
				pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}

		if (pageTemp <= totalPages)
		{
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		}
		
		return pagingStr;
	}
}
