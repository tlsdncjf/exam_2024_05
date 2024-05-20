package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.PlaceService;
import com.example.demo.vo.ThemePlace;

@Controller
public class UsrHomeController {
	
	@Autowired
	PlaceService PlaceService;


	

	@RequestMapping("/")
	public String showRoot() {

		return "redirect:/usr/home/main";
	}
	
	@RequestMapping("/usr/home/main")
	public String showWeatherPlacesDaeJeon(Model model) {
	    // PlaceService를 사용하여 관련 데이터 가져오기
	    List<ThemePlace> parkPlaces = PlaceService.getAllParkPlaces();
	    List<ThemePlace> recreationalForests = PlaceService.getAllRecreationalForests();
	    List<ThemePlace> museums = PlaceService.getAllMuseums();
	    List<ThemePlace> artMuseums = PlaceService.getDaeJeonArtMuseums();
	    List<ThemePlace> historicalSites = PlaceService.getDaeJeonHistoricalSites();

	    // 모델에 데이터 추가
	    model.addAttribute("parkPlaces", parkPlaces);
	    model.addAttribute("recreationalForests", recreationalForests);
	    model.addAttribute("museums", museums);
	    model.addAttribute("artMuseums", artMuseums);
	    model.addAttribute("historicalSites", historicalSites);

	    // 해당 view 반환
	    return "usr/home/main";
	}
	
}