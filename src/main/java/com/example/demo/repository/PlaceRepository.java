package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.ThemePlace;

@Mapper
public interface PlaceRepository {

	@Select("""
			SELECT *
			FROM themePlace
			WHERE region = '대전'
			AND `type` = '공원';
			""")
	public List<ThemePlace> getAllParkPlaces();
	


	@Select("""
			SELECT *
			FROM themePlace
			where region = '대전'
			AND `type` = '휴양림';
			""")
	public List<ThemePlace> getAllRecreationalForests();
	
	
	@Select("""
			SELECT *
			FROM themePlace
			WHERE region = '대전'
			AND `type` = '박물관';
			""")
	public List<ThemePlace> getAllMuseums();
	
	
	@Select("""
			SELECT *
			FROM themePlace
			WHERE region = '대전'
			AND `type` = '미술관';
			""")
	public List<ThemePlace> getDaeJeonArtMuseums();
	

	
	@Select("""
			SELECT *
			FROM themePlace
			WHERE region LIKE '대전%'
			AND `type` = '유적지';
			""")
	public List<ThemePlace> getDaeJeonHistoricalSites();
	

	
	@Select("""
			SELECT *
			FROM themePlace
			WHERE id = #{id}
			""")
	public ThemePlace getThemePlaceById(int id);
	

	
	
}
