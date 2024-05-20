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
public class PlaceController {

	@Autowired
	PlaceService PlaceService;

	public PlaceController() {

	}
	
}