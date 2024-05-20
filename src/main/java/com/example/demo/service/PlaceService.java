package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.PlaceRepository;
import com.example.demo.vo.ThemePlace;

@Service
public class PlaceService {
	@Autowired
	private PlaceRepository PlaceRepository;

	public PlaceService(PlaceRepository placeRepository) {
		this.PlaceRepository = placeRepository;
	}

	public List<ThemePlace> getAllParkPlaces() {

		return PlaceRepository.getAllParkPlaces();
	}
	

	
	public List<ThemePlace> getAllRecreationalForests() {

		return PlaceRepository.getAllRecreationalForests();
	}
	
	

	public List<ThemePlace> getAllMuseums() {
		return PlaceRepository.getAllMuseums();
	}



	public List<ThemePlace> getDaeJeonArtMuseums() {
		return PlaceRepository.getDaeJeonArtMuseums();
	}


	public List<ThemePlace> getDaeJeonHistoricalSites() {
		return PlaceRepository.getDaeJeonHistoricalSites();
	}
	
	
	public ThemePlace getThemePlaceById(int id) {
		return PlaceRepository.getThemePlaceById(id);
	}
}
