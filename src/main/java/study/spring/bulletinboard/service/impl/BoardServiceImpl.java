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
		int result = 0;
		
		try
		{
			result = sqlSession.insert("BoardMapper.insertItem", input);	// mapper의 등록 sql 부르기
			
			if(result == 0)
			{
				throw new NullPointerException("result=0");
			}
			
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
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
