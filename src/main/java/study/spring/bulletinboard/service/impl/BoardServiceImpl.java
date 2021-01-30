package study.spring.bulletinboard.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.bulletinboard.model.Board;
import study.spring.bulletinboard.model.Chart;
import study.spring.bulletinboard.service.BoardService;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService
{
	// Mybatis
	@Autowired
	SqlSession sqlSession;

	// 리스트 조회
	@Override
	public List<Board> getBoardList(Board input) throws Exception
	{
		List<Board> result = null;

		try
		{
			result = sqlSession.selectList("BoardMapper.selectList", input);
			
			if(result == null)
			{
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	// 상세 페이지 조회
	@Override
	public Board getBoardItem(Board input) throws Exception
	{
		Board result = null;
		
		try
		{
			result = sqlSession.selectOne("BoardMapper.selectItem", input);
			
			if(result == null)
			{
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("no data getBoardItem serviceimpl");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("fail getBoardItem serviceimpl");
		}
		
		return result;
	}

	// 게시글 등록
	@Override
	public int addBoard(Board input) throws Exception
	{
		int result = 0;

		try
		{
			result = sqlSession.insert("BoardMapper.insertItem", input); // mapper의 등록 sql 부르기
			
			if (result == 0)
			{
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("no data addBoard serviceimpl");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("fail addBoard serviceimpl");
		}

		return result;
	}

	// 개수 조회
	@Override
	public int getBoardCount(Board input) throws Exception
	{
		int result = 0;
		
		try
		{
			result = sqlSession.selectOne("BoardMapper.selectCountAll", input);
			
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	// 게시글 수정
	@Override
	public int editBoard(Board input) throws Exception
	{
		int result = 0;
		
		try
		{
			result = sqlSession.update("BoardMapper.updateItem", input);
			
			if(result == 0)
			{
				throw new NullPointerException("result=0");
			}
			
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("none.");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("fail edit.");
		}
		return 0;
	}

	// 게시글 삭제
	@Override
	public int deleteBoard(Board input) throws Exception
	{
		int result = 0;
		
		try
		{
			result = sqlSession.delete("BoardMapper.deleteItem", input);
			
			if(result == 0)
			{
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;
	}

	// 라인 차트
	@Override
	public List<Chart> getLineList() throws Exception
	{
		List<Chart> result = null;
		
		try
		{
			System.out.println(1111111111);
			result = sqlSession.selectList("BoardMapper.selectLine");
			System.out.println(222222222);
			
			
			if(result == null)
			{
				throw new NullPointerException("result=null");
			}
			
			System.out.println(result.size());
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
