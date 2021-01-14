package study.spring.bulletinboard.model;

import lombok.Data;

@Data
public class Board
{
	// 기본 컬럼
	private int no;
	private String writer;
	private String title;
	private String content;
	private String crt_date;
	private int hits;

	// 페이지 구현을 위한 static 변수
	private static int offset;
	private static int listCount;

	public static int getOffset()
	{
		return offset;
	}

	public static void setOffset(int offset)
	{
		Board.offset = offset;
	}

	public static int getListCount()
	{
		return listCount;
	}

	public static void setListCount(int listCount)
	{
		Board.listCount = listCount;
	}

}
