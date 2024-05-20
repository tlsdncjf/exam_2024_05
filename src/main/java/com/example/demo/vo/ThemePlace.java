package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThemePlace {
	private int id;
	private String name;
	private String region;
	private String roadLocation;
	private double latitude;
	private double longitude;
	private String phoneNumber;
	private String body;
	private String price;
	private String imgAdr;
	private String type;
}