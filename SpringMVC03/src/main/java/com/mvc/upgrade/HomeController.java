package com.mvc.upgrade;

import java.awt.peer.LightweightPeer;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.upgrade.model.biz.BoardBiz;
import com.mvc.upgrade.model.dto.BoardDto;
import com.mvc.upgrade.model.dto.testDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BoardBiz biz;

	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model) {
		logger.info("select list");
		model.addAttribute("list",biz.selectList());
		
		return "list";
	}
	
	@RequestMapping(value = "/selectOne.do", method = RequestMethod.GET)
	public String selectOne(Model model, int myno) {
		System.out.println(myno);
		model.addAttribute("detail", biz.selectOne(myno));
		return "detail";
	}
	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("boardDto", new BoardDto());
		return "insert";
	}
	@RequestMapping(value = "/insertRes.do", method = RequestMethod.POST)
	public String insertRes(@ModelAttribute("boardDto") @Valid BoardDto boardDto, BindingResult result, Model model) {
		if(result.hasErrors()) {
			
    		return "insert";
    	}
		int res = biz.insert(boardDto);
		System.out.println(res);
		if(res>0) {
			return "redirect:list.do";
		}else {
			return "redirect:insertform.do";
		}
	}
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(@RequestParam("myno")int myno2, Model model) {
		logger.info("myno:"+myno2);
		model.addAttribute("dto", biz.selectOne(myno2));
		
		return "updateform";
	}
	@RequestMapping(value = "/updateRes.do", method = RequestMethod.POST)
	public String updateRes(BoardDto dto) {
		int res = biz.update(dto);
		
		if(res>0) {
			return "redirect:list.do";
		}else {
			return "redirect: update.do?myno="+dto.getMyno();
		}
	}
	@RequestMapping(value="/delete.do", method =RequestMethod.GET)
	public String delete(int myno) {
		int res = biz.delete(myno);
		
		if(res>0) {
			return "redirect:list.do";
		}else {
		return "redirect: selectOne.do?myno="+myno;
		}
	}
	
}
