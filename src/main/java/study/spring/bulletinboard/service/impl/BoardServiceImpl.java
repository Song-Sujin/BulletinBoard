package study.spring.bulletinboard.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.bulletinboard.model.Board;
import study.spring.bulletinboard.service.BoardService;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService
{
	// Mybatis
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Board> getBoardList(Board input) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board getBoardItem(Board input) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addBoard(Board input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getBoardCount(Board input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editBoard(Board input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(Board input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

}
