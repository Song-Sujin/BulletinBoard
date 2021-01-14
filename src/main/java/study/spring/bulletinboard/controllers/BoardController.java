package study.spring.bulletinboard.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.bulletinboard.helper.RegexHelper;
import study.spring.bulletinboard.helper.WebHelper;
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
	public ModelAndView list(Model model)
	{
		return new ModelAndView("board/list");
	}
	
	// 상세 페이지 조회
	@RequestMapping(value="/board/view.do", method=RequestMethod.GET)
	public ModelAndView view(Model model)
	{
		return null;
	}
	
	// 게시글 등록 폼 페이지
	@RequestMapping(value="/board/add.do", method=RequestMethod.GET)
	public ModelAndView add(Model model)
	{
		return new ModelAndView("board/add");
	}
	
	// 게시글 등록에 대한 action 페이지
	@RequestMapping(value="/board/add_ok.do", method=RequestMethod.POST)
	public ModelAndView add_do(Model model)
	{
		return null;
	}
	
	// 게시글 수정 폼 페이지
	@RequestMapping(value="/board/edit.do", method=RequestMethod.GET)
	public ModelAndView edit(Model model)
	{
		return null;
	}
	
	// 게시글 수정에 대한 action 페이지
	@RequestMapping(value="/board/edit_ok.do", method=RequestMethod.POST)
	public ModelAndView edit_ok(Model model)
	{
		return null;
	}
	
	// 게시글 삭제
	@RequestMapping(value="/board/delete_ok.do", method=RequestMethod.GET)
	public ModelAndView delete_ok(Model model)
	{
		return null;
	}

}
