package com.example.demo.service;

import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CSVRepository;
import com.example.demo.vo.ThemePlace;
import com.opencsv.CSVReader;

@Service
public class CSVService {

	@Autowired
	private CSVRepository csvRepository;

	public String readAndSaveToDB1() {
		try {
			List<ThemePlace> themePlaceList = new ArrayList<>();

			// 예시 파일들을 배열에 추가
			String[] fileNames = { "테마별여행지.csv" };

			for (String fileName : fileNames) {
				InputStreamReader is = new InputStreamReader(
						getClass().getClassLoader().getResourceAsStream("CSV/" + fileName), "EUC-KR");
				CSVReader reader = new CSVReader(is);

				// 첫 번째 줄(헤더) 건너뛰기
				reader.skip(1);

				List<String[]> list = reader.readAll();

				for (String[] csvRow : list) {
					ThemePlace place = new ThemePlace();
					// 엔터티의 필드에 CSV 데이터를 할당
					place.setName(csvRow[0]);
					place.setRegion(csvRow[1]);
					place.setRoadLocation(csvRow[2]);
					place.setLatitude(Double.parseDouble(csvRow[3])); // double 타입으로 변환
					place.setLongitude(Double.parseDouble(csvRow[4])); // double 타입으로 변환
					place.setPhoneNumber(csvRow[5]);
					place.setBody(csvRow[6]);
					place.setPrice(csvRow[7]);
					place.setImgAdr(csvRow[8]);
					place.setType(csvRow[9]);

					themePlaceList.add(place);
				}
			}

			// CSV 데이터를 데이터베이스에 저장
			csvRepository.insertCSVList1(themePlaceList);

			return "CSV 데이터가 성공적으로 데이터베이스에 저장되었습니다.";

		} catch (Exception e) {
			e.printStackTrace();
			return "CSV 데이터를 데이터베이스에 저장하는 중 오류가 발생했습니다.";
		}
	}

}