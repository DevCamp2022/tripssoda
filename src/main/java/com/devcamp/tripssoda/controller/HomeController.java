package com.devcamp.tripssoda.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import com.devcamp.tripssoda.dto.PageHandler;
import com.devcamp.tripssoda.dto.ProductDto;
import com.devcamp.tripssoda.dto.SearchCondition;
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
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	public HomeController(ProductService productService, AdminBoardService adminBoardService){
		this.productService = productService;
		this.adminBoardService = adminBoardService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model m,SearchCondition sc, @RequestParam(value="menuCode",defaultValue="0") String menuCode) {

		productService.getMainList(m);

		try {
			//menuCode 게시판아이디를 같이 보내준다
			int totalCnt = adminBoardService.getSearchResultCntForUser(sc, menuCode);
			m.addAttribute("totalCnt", totalCnt);

			PageHandler pageHandler = new PageHandler(totalCnt, sc);

			List<CombinedBoardDto> noticeList = adminBoardService.getSearchResultPageForUser(sc, "M001");
			List<CombinedBoardDto> promotionList = adminBoardService.getSearchResultPageForUser(sc, "M002");
			List<CombinedBoardDto> faqList = adminBoardService.getSearchResultPageForUser(sc, "M003");
			m.addAttribute("noticeList", noticeList);
			m.addAttribute("promotionList", promotionList);
			m.addAttribute("faqList", faqList);
			m.addAttribute("ph", pageHandler);

//			System.out.println("noticeList.toString() = " + noticeList.toString());

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "LIST_ERR");
			m.addAttribute("totalCnt", 0);
		}
		return "home/home.mainTiles";
	}
}
