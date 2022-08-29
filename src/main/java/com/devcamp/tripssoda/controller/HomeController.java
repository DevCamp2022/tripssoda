package com.devcamp.tripssoda.controller;

import java.text.DateFormat;
import java.util.*;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.service.AccompanyService;
import com.devcamp.tripssoda.service.AdminBoardService;
import com.devcamp.tripssoda.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
	private final ProductService productService;
	private final AdminBoardService adminBoardService;
	private final AccompanyService accompanyService;


	public HomeController(ProductService productService, AdminBoardService adminBoardService, AccompanyService accompanyService){
		this.productService = productService;
		this.adminBoardService = adminBoardService;
		this.accompanyService = accompanyService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model m,SearchCondition sc, @RequestParam(value="menuCode",defaultValue="0") String menuCode) {

		productService.getMainList(m);

		try {
			//menuCode 게시판아이디를 같이 보내준다
			int totalCnt = adminBoardService.getSearchResultCntForUser(sc, menuCode);
			m.addAttribute("totalCnt", totalCnt);

			PageHandler pageHandler = new PageHandler(totalCnt, sc);
			PageHandlerOld pageHandlerOld = new PageHandlerOld(totalCnt, sc.getPage(), sc.getPageSize());

			Map map = new HashMap();
			map.put("offset", (sc.getPage()-1)*sc.getPageSize());
			map.put("pageSize", sc.getPageSize());

			List<AccompanyDto> accompanyList = accompanyService.selectAccompanyForMain(map);
			for(AccompanyDto a : accompanyList){
				System.out.println("a.toString() = " + a.toString());
			}
			List<CombinedBoardDto> noticeList = adminBoardService.getSearchResultPageForUser(sc, "M001");
			List<CombinedBoardDto> promotionList = adminBoardService.getSearchResultPageForUser(sc, "M002");
			List<CombinedBoardDto> faqList = adminBoardService.getSearchResultPageForUser(sc, "M003");
			m.addAttribute("accompanyList", accompanyList);
			m.addAttribute("noticeList", noticeList);
			m.addAttribute("promotionList", promotionList);
			m.addAttribute("faqList", faqList);
			m.addAttribute("ph", pageHandler);

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
			m.addAttribute("totalCnt", 0);
		}
		return "home/home.mainTiles";
	}
}
