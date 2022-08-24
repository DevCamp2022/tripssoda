package com.devcamp.tripssoda.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.devcamp.tripssoda.dto.ProductDto;
import com.devcamp.tripssoda.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	private final ProductService productService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	public HomeController(ProductService productService){
		this.productService = productService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		productService.getMainList(model);

		return "home/home.mainTiles";
	}
}
