package util;

public class PagingUtil {
	
	public static String pagingBlock(int totalCount, int pageSize, int blockSize,
			int pageNum, String reqUri) {
		String pagingRes = "";
		
		//totalCount: 총 행 개수
		//pageSize: 한 페이지 당 행 개수
		//blockSize: 한 페이지 블록 당 페이지 개수
		//pageNum: 현재 페이지
		
		//총 페이지 개수
		int totalPage = (int) Math.ceil( (double) totalCount / pageSize );
		
		//각 페이지 블록의 첫번째 페이지
		int pageTemp = ( ( (pageNum-1)/blockSize ) * blockSize) + 1;
		
		// [first] ◀ 6 7 8 9 10 ▶ [last]
		
		if (pageTemp != 1) {
			pagingRes = "<a href='"+reqUri+"'>[first]</a>";
			pagingRes += "&nbsp;";
			pagingRes += "<a href='"+reqUri+"?pageNum="+(pageTemp-1)+"'>◀</a>";
		}
		
		int blockCount = 1;
		while (blockCount <= blockSize && pageTemp <= totalPage) {
			if (pageTemp == pageNum) {
				pagingRes += "&nbsp;"+pageTemp+"&nbsp;";
			}
			else {
				pagingRes += "&nbsp;<a href='"+reqUri+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		if (pageTemp <= totalPage) {
			pagingRes += "<a href='"+reqUri+"?pageNum="+pageTemp+"'>▶</a>";
			pagingRes += "&nbsp;";
			pagingRes += "<a href='"+reqUri+"?pageNum="+totalPage+"'>[last]</a>";
		}
		
		
		return pagingRes;
	}
	
	
	
	public static String pagingCenter(int totalCount, int pageSize, int blockSize,
			int pageNum, String reqUri) {
		String pagingRes = "";
		
		//totalCount: 총 행 개수
		//pageSize: 한 페이지 당 행 개수
		//blockSize: 한 페이지 블록 당 페이지 개수
		
		//총 페이지 개수
		int totalPage = (int) Math.ceil( (double) totalCount / pageSize );
		
		int div = blockSize/2;
		int lastPoint = totalPage - (blockSize - 1);
		int pageTemp = pageNum - div;
		
		if (pageTemp < 1) pageTemp = 1;
		else if (pageTemp > lastPoint) pageTemp = lastPoint;
		
//		int pageTemp = 0;
//		if (pageNum < 3) pageTemp = 1;
//		else pageTemp = pageNum-2;
		
		// [first] 3 4 5 6 7 [last] (현재 페이지가 가운데로 오게)
		
		if (pageNum != 1) {
			pagingRes = "<a href='"+reqUri+"'>[first]</a>";
		}
		
		int count = 1;
		while (count <= blockSize && pageTemp <= totalPage) {
			if (pageTemp == pageNum) {
				pagingRes += "&nbsp;"+pageTemp+"&nbsp;";
			}
			else {
				pagingRes += "&nbsp;<a href='"+reqUri+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			count++;
		}
		
		if (pageNum != totalPage) {
			pagingRes += "<a href='"+reqUri+"?pageNum="+totalPage+"'>[last]</a>";
		}
		
		
		return pagingRes;
	}
	
}
