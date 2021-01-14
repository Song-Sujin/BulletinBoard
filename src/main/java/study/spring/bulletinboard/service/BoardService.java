package study.spring.bulletinboard.service;

import java.util.List;

import study.spring.bulletinboard.model.Board;

// 구현해야 하는 기능들
public interface BoardService
{
	// 리스트 조회
	public List<Board> getBoardList(Board input) throws Exception;
	
	// 상세 페이지 조회
	public Board getBoardItem(Board input) throws Exception;
	
	// 게시글 등록
	public int addBoard(Board input) throws Exception;
	
	// 전체 게시글 수 조회
	public int getBoardCount(Board input) throws Exception;
	
	// 게시글 수정
	public int editBoard(Board input) throws Exception;
	
	// 게시글 삭제
	public int deleteBoard(Board input) throws Exception;

}
