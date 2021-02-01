package study.spring.bulletinboard.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import study.spring.bulletinboard.helper.RegexHelper;
import study.spring.bulletinboard.helper.WebHelper;
import study.spring.bulletinboard.model.Board;
import study.spring.bulletinboard.model.Chart;
import study.spring.bulletinboard.service.BoardService;

@Controller
public class BoardController
{
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	BoardService boardService;
	
	// "/프로젝트이름"에 해당하는 ContextPath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 리스트 조회
	@RequestMapping(value="/board/list.do", method=RequestMethod.GET)
	public ModelAndView list(Model model,
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage)
	{
		/*
		// 1) 페이지 구현에 필요한 변수값 생성
		MyUtil util = new MyUtil();
		int currentPage = 1;
		*/
		
		// 2) 데이터 조회하기
		Board input = new Board();
		input.setTitle(keyword);
		
		List<Board> output = null;
		
		try
		{
			
			output = boardService.getBoardList(input);
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) View 처리
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		
		return new ModelAndView("board/list");
	}
	
	// 상세 페이지 조회
	@RequestMapping(value="/board/view.do", method=RequestMethod.GET)
	public ModelAndView view(Model model,
			@RequestParam(value="no", defaultValue="0") int no)
	{
		// 유효성 검사
		if(no == 0)
		{
			return webHelper.redirect(null, "does not exist no -> view.do");
		}
		
		// 데이터 조회
		Board input = new Board();
		input.setNo(no);
		
		Board output = null;
		
		try
		{
			output = boardService.getBoardItem(input);
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// View 처리
		model.addAttribute("output", output);
		return new ModelAndView("board/view");
	}
	
	// 게시글 등록 폼 페이지
	@RequestMapping(value="/board/add.do", method=RequestMethod.GET)
	public ModelAndView add(Model model)
	{
		return new ModelAndView("board/add");
	}
	
	// 게시글 등록에 대한 action 페이지
	@RequestMapping(value="/board/add_ok.do", method=RequestMethod.POST)
	public ModelAndView add_do(Model model,
			@RequestParam(value="title", required=false) String title,
			@RequestParam(value="content", required=false) String content,
			@RequestParam(value="writer", required=false) String writer)
	{
		// 유효성 검사
		if(title.equals(""))
		{
			return webHelper.redirect(null, "input title");
		}
		
		if(content.equals(""))
		{
			return webHelper.redirect(null, "input content");
		}
		
		if(writer.equals(""))
		{
			return webHelper.redirect(null, "input writer");
		}
		
		// 데이터 저장
		Board input = new Board();
		input.setTitle(title);
		input.setContent(content);
		input.setWriter(writer);
		
		try
		{
			// 데이터 저장
			// 저장 성공하면 input 객체에 pk값인 no가 저장됨 -> DB에 PK값 지정하기
			boardService.addBoard(input);
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 등록한 게시물을 확인하는 상세 페이지 이동
		// 저장 결과를 확인하기 위해서 pk값을 상세 페이지로 전달
		//String redirectUrl = contextPath + "/board/view.do?no=" + input.getNo(); --> 실패. 에러남 useGeneratedKeys 재확인
		
		// 리스트 화면으로 이동
		String redirectUrl = contextPath + "/board/list.do";
		return webHelper.redirect(redirectUrl, "success add_ok");
	}
	
	// 게시글 수정 폼 페이지
	@RequestMapping(value="/board/edit.do", method=RequestMethod.GET)
	public ModelAndView edit(Model model,
			@RequestParam(value="no", defaultValue="0") int no)
	{
		// 파라미터 유효성 검사
		if(no == 0)
		{
			return webHelper.redirect(null, "does not exist no");
		}
		
		// 데이터 조회
		Board input = new Board();
		input.setNo(no);
		
		Board output = null;
		
		try
		{
			output = boardService.getBoardItem(input);
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// View 처리
		model.addAttribute("output", output);
		return new ModelAndView("board/edit");
	}
	
	// 게시글 수정에 대한 action 페이지
	@RequestMapping(value="/board/edit_ok.do", method=RequestMethod.POST)
	public ModelAndView edit_ok(Model model,
			@RequestParam(value="no", defaultValue="0") int no,
			@RequestParam(value="title", required=false) String title,
			@RequestParam(value="content", required=false) String content,
			@RequestParam(value="writer", required=false) String writer)
	{
		// 유효성 검사
		if(title.equals(""))
		{
			return webHelper.redirect(null, "input title");
		}
		
		if(content.equals(""))
		{
			return webHelper.redirect(null, "input content");
		}
		
		if(writer.equals(""))
		{
			return webHelper.redirect(null, "input writer");
		}
		
		// 데이터 수정
		Board input = new Board();
		input.setNo(no);
		input.setTitle(title);
		input.setContent(content);
		input.setWriter(writer);
		
		try
		{
			boardService.editBoard(input);
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 결과를 확인하기 위한 페이지 이동
		String redirectUrl = contextPath + "/board/view.do?no=" + input.getNo();
		return webHelper.redirect(redirectUrl, "success edit_ok");
	}
	
	// 게시글 삭제
	@RequestMapping(value="/board/delete_ok.do", method=RequestMethod.GET)
	public ModelAndView delete_ok(Model model,
			@RequestParam(value="no", defaultValue="0") int no)
	{
		// 파라미터 유효성 검사
		if(no == 0)
		{
			return webHelper.redirect(null, "does not exist no");
		}
		
		// 데이터 삭제
		Board input = new Board();
		input.setNo(no);
		
		try
		{
			boardService.deleteBoard(input);
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 페이지 이동
		return webHelper.redirect(contextPath + "/board/list.do", "delete success.");
	}
	
	// ----------- 구글 차트 추가 ------------
	// 차트 목록
	@RequestMapping(value="/board/statistics.do", method=RequestMethod.GET)
	public ModelAndView statistics_view(Model model)
	{
		return new ModelAndView("board/statistics");
	}
	
	// 컬럼 차트
	@RequestMapping(value="/board/google_column.do", method=RequestMethod.GET)
	public ModelAndView google_column(Model model)
	{
		return new ModelAndView("board/google_column");
	}
	
	// 라인 차트
	@RequestMapping(value="/board/google_line.do", method=RequestMethod.GET)
	public ModelAndView google_line(Model model)
	{
		ModelAndView mav = new ModelAndView();
		
		List<Chart> output = null;
		
		try
		{
			System.out.println(55555);
			output = boardService.getLineList();
			mav.addObject("output", output);
			mav.setViewName("board/google_line");
			
			System.out.println("리스트사이즈:" + output.size());
			for(int i=0;i<output.size();i++)
			{
				System.out.println(output.get(i).getVisit_date());
			}
			
			String str = "[";
			str += "['날짜', 'direct', 'others'],";
			int num = 0;
			for(Chart dto : output)
			{
				str += "['";
				str += dto.getVisit_date();
				str += "', ";
				str += dto.getVisit_direct();
				str += ", ";
				str += dto.getVisit_others();
				str += "]";
				
				num++;
				if(num<output.size())
					str += ",";
			}
			str += "]";
			mav.addObject("str", str);
			
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return mav;
	}

	// 파이 차트
	@RequestMapping(value="/board/google_pi.do", method=RequestMethod.GET)
	public ModelAndView google_pi(Model model)
	{
		return new ModelAndView("board/google_pi");
	}
	
	// 산점도 차트
	@RequestMapping(value="/board/google_scatter.do", method=RequestMethod.GET)
	public ModelAndView google_scatter(Model model)
	{
		return new ModelAndView("board/google_scatter");
	}

	// ----------- c3.js 추가 ------------
	@RequestMapping(value="/board/c3_line.do", method=RequestMethod.GET)
	public ModelAndView c3_line(Model model)
	{
		return new ModelAndView("board/c3_line");
	}
	

}
