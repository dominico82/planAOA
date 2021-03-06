package nfit.page;

public class PageModuleFAQ {
	
	public static String makePageFAQ(String pagename, int totalCnt, int listSize, int pageSize, String category, String keyword, String tag, int cp){
		
		int totalPage=totalCnt/listSize+1;
		if(totalCnt%listSize==0)totalPage--;

		int userGroup=cp/pageSize;
		if(cp%pageSize==0)userGroup--; 
		
		StringBuffer sb=new StringBuffer();//문자열을 사용하면 자원낭비가 심하므로 스트링버퍼를 사용해서 문자열을 담아준다.
		
		if(!(category.equals("0"))){
			if(userGroup!=0	){
				sb.append("<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=(userGroup-1)*pageSize+pageSize;
				sb.append(temp);
				sb.append("&category=");
				sb.append(category);
				sb.append("'>&lt;&lt;</a>");		
			}
			for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
				sb.append("&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&category=");
				sb.append(category);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;");
		
				if(i==totalPage)break;
			}
			if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
				sb.append("<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=((userGroup+1)*pageSize+1);
				sb.append(temp);
				sb.append("&category=");
				sb.append(category);
				sb.append("'>&gt;&gt;</a>");
			
			}
		}else if(!(keyword.equals("0"))){
			if(userGroup!=0	){
				sb.append("<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=(userGroup-1)*pageSize+pageSize;
				sb.append(temp);
				sb.append("&keyword=");
				sb.append(keyword);
				sb.append("'>&lt;&lt;</a>");		
			}
			for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
				sb.append("&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&keyword=");
				sb.append(keyword);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;");
		
				if(i==totalPage)break;
			}
			if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
				sb.append("<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=((userGroup+1)*pageSize+1);
				sb.append(temp);
				sb.append("&keyword=");
				sb.append(keyword);
				sb.append("'>&gt;&gt;</a>");
			
			}
		}else if(!(tag.equals("0"))){
			if(userGroup!=0	){
				sb.append("<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=(userGroup-1)*pageSize+pageSize;
				sb.append(temp);
				sb.append("&tag=");
				sb.append(tag);
				sb.append("'>&lt;&lt;</a>");		
			}
			for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
				sb.append("&nbsp;&nbsp;<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				sb.append(i);
				sb.append("&tag=");
				sb.append(tag);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>&nbsp;&nbsp;");
		
				if(i==totalPage)break;
			}
			if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
				sb.append("<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=((userGroup+1)*pageSize+1);
				sb.append(temp);
				sb.append("&tag=");
				sb.append(tag);
				sb.append("'>&gt;&gt;</a>");
			
			}
		}
		return sb.toString();
	}
}
