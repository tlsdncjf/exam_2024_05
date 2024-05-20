<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>

<script>
    $(document).ready(function() {
        // 여러분의 OpenWeatherMap API 키
        var apiKey = '5d7a915f0fea8a335322d566d2ce04af';

        // 현재 날씨 데이터를 가져오기 위한 API 엔드포인트
        var apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

        var cityNameKorean = '대전'; // 도시 이름 한국어 표시용
        var cityNameEnglish = 'daejeon'; // 도시 이름 영어 API 요청용

        var params = {
            q: cityNameEnglish,
            appid: apiKey,
            units: 'metric'
        };

        // 날씨 데이터를 가져오기 위한 AJAX 요청
        $.ajax({
            url: apiUrl,
            data: params,
            dataType: 'json',
            success: function(data) {
                // 날씨 아이콘 처리
                var weatherIcon = data.weather[0].icon;
                var iconUrl = 'http://openweathermap.org/img/wn/' + weatherIcon + '.png';
                $('.weather-icon').html('<img src="' + iconUrl + '">');

                // 온도 처리
                var temperature = Math.round(data.main.temp);
                $('.temperature').text(temperature + '°C');
                
                // 습도 처리
                var humidity = data.main.humidity;
                $('.humidity').text('습도: ' + humidity + '%');

                // 풍속 처리
                var windSpeed = data.wind.speed;
                $('.wind-speed').text('풍속: ' + windSpeed + 'm/s');

                // 도시 이름 처리
                $('.city').text(cityNameKorean);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error('날씨 데이터 가져오기 오류:', error);
            }
        });

        $.getJSON(apiUrl, params, function(data) {
            // 날씨 데이터를 파싱합니다.
            var temperature = data.main.temp;
            var weatherDescription = data.weather[0].description;

            // 조건문을 적용하여 추천을 생성합니다.
            var recommendation1, recommendation2;
            if (weatherDescription.includes('clear')) {
                recommendation1 = '금일 날씨가 화창합니다.';
                recommendation2 = '집에만 있지말고 밖에 나가서 놀아볼까요?';
                $('#parkPlacesContainer').show();
                $('#recreationalForestsContainer').show();
                $('#museumContainer').show();
                $('#artMuseumContainer').show();
                $('#historicalSiteContainer').show();

            } else if (weatherDescription.includes('clouds')) {
                recommendation1 = '금일 구름이 많은 날씨입니다.';
                recommendation2 = '이런 활동 어떠세요?';
                $('#parkPlacesContainer').show();
                $('#recreationalForestsContainer').show();
                $('#museumContainer').show();
                $('#artMuseumContainer').show();
                $('#historicalSiteContainer').show();
            } else if (weatherDescription.includes('rain')) {
                recommendation1 = '금일 비가 오고 있습니다.';
                recommendation2 = '야외활동 말고, 이런 실내 활동 어떠세요?';
                $('#parkPlacesContainer').hide();
                $('#recreationalForestsContainer').hide();
                $('#museumContainer').show();
                $('#artMuseumContainer').show();
                $('#historicalSiteContainer').hide();
            } else {
                recommendation1 = '추천: 도시를 탐험하세요!';
                $('#parkPlacesContainer').show();
                $('#recreationalForestsContainer').show();
                $('#museumContainer').show();
                $('#artMuseumContainer').show();
                $('#historicalSiteContainer').show();
            }

            // 추천을 표시합니다.
            $('#recommendation1').text(recommendation1);
            $('#recommendation2').text(recommendation2);
        });

     // "대전" 버튼 클릭 시 total_box 표시 및 숨기기 토글
        $("#showTotalBoxButton").click(function() {
            $(".total_box").toggle();
        });
        
        // 기존 버튼 이벤트 처리
        $("#parkButton").click(function() {
            $("#parkPlacesContainer").show();
            $("#recreationalForestsContainer").hide();
            $("#museumContainer").hide();
            $("#artMuseumContainer").hide();
            $("#historicalSiteContainer").hide();
        });

        $("#recreationalButton").click(function() {
            $("#parkPlacesContainer").hide();
            $("#museumContainer").hide();
            $("#recreationalForestsContainer").show();
            $("#artMuseumContainer").hide();
            $("#historicalSiteContainer").hide();
        });

        $("#museumButton").click(function() {
            $("#parkPlacesContainer").hide();
            $("#recreationalForestsContainer").hide();
            $("#museumContainer").show();
            $("#artMuseumContainer").hide();
            $("#historicalSiteContainer").hide();
        });

        $("#artMuseumButton").click(function() {
            $("#parkPlacesContainer").hide();
            $("#recreationalForestsContainer").hide();
            $("#museumContainer").hide();
            $("#artMuseumContainer").show();
            $("#historicalSiteContainer").hide();
        });

        $("#historicalSiteButton").click(function() {
            $("#parkPlacesContainer").hide();
            $("#recreationalForestsContainer").hide();
            $("#museumContainer").hide();
            $("#artMuseumContainer").hide();
            $("#historicalSiteContainer").show();
        });
    });
</script>

<style>
    .weater-container-box {
        position: fixed;
        top: 100px; /* 위에서 20px 위치에 고정 */
        left: 20px; /* 오른쪽에서 20px 위치에 고정 */
        background-color: rgba(0, 0, 0, 0.4);
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        color: white;
        z-index: 1000;
    }

    .weather-icon img {
        width: 150px; /* 아이콘 크기 조정 */
        height: 150px;
        margin-bottom: 10px;
        margin-left: 10px;
    }

    .weather-icon {
        width: auto;
    }

    .daejeon_hot {
        margin-left: 24%;
        margin-top: 4%;
        margin-right: 10%;
    }

    .daejeon_hot > h2 {
        font-size: 24px;
        font-weight: bold;
    }

    .daejeon_hot > p {
        font-size: 18px;
        line-height: 40px;
    }

    .button-container {
        text-align: right;
        margin-right: 75px;
        font-size: 16px;
        font-weight: 700;
    }

    .button-container button {
        margin-right: 10px;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start; /* 아이템을 왼쪽으로 정렬합니다 */
        margin-bottom: 100px;
    }

    .square-box {
        width: calc(33.33%); /* 한 행에 3개의 상자를 배치하고 간격을 조정합니다. */
        margin-bottom: 20px; /* 행 사이의 간격을 조정합니다. */
        margin-top: 2%;
        margin-right: 10px; /* 항목 간의 마진을 추가합니다 */
    }

    .square-box img {
        width: 80%;
        height: auto;
        border-radius: 10px 10px 0 0;
    }

    .square-box p {
        margin-top: 10px;
    }

    .recommend_place {
        display: flex;
        flex-wrap: wrap; /* 너비가 충분하지 않을 때 항목이 다음 줄로 내려가도록 합니다. */
        gap: 20px; /* 각 상자 사이의 간격 */
        margin-left: 500px;
        margin-right: 400px;
        margin-top: 50px;
    }

    .square-box {
        width: 300px;
        height: 300px;
    }

    .square-box > img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .total_box {
        display: none; /* 초기에는 숨기기 */
    }
    
    .button button {
        /* 배경 이미지 설정 */
        background-image: url('https://i.ibb.co/HXHzGBp/image.jpg');
        /* 배경 이미지 크기 지정 */
        background-size: cover;
        /* 버튼의 너비와 높이 설정 */
        width: 200px;
        height: 50px;
        /* 텍스트의 색상을 흰색으로 지정 */
        color: white;
        /* 폰트 크기 및 스타일 설정 */
        font-size: 20px;
        font-weight: bold;
        /* 버튼 테두리 스타일 설정 */
        border: none;
        /* 버튼 내부의 텍스트를 가운데 정렬 */
        text-align: center;
        /* 배경 이미지가 버튼의 내용을 가리지 않도록 배경 이미지 위치 조정 */
        background-position: center;
    }
</style>

<!-- "대전" 버튼 -->
<div class="button" style="text-align: center; margin-top:20px">
    <button id="showTotalBoxButton">대전</button>
</div>

<div class="total_box">
    <div class="weater-container-box" style="margin-left: 5%; margin-top: 7%;">
        <div class="city" style="font-size: 30px; font-weight: 700;"></div>
        <div class="weather-icon"></div>
        <div class="temperature" style="font-size: 30px; color: red; margin-top: 40px;"></div>
        <div class="humidity" style="font-size: 18px; margin-top: 10px;"></div>
    	<div class="wind-speed" style="font-size: 18px; margin-top: 10px;"></div>
        <div id="recommendation1"></div>
        <div id="recommendation2"></div>
        <br />
        <div class="clock">
            <span id="Seoul"></span>
        </div>
    </div>
    <div class="daejeon_hot">
        <h2 style="margin-top: -10px">대전 관광 명소</h2>

        <div class="button-container">
            <!-- 공원 버튼 -->
            <button id="parkButton">공원</button>
            <!-- 휴양림 버튼 -->
            <button id="recreationalButton">휴양림</button>
            <!-- 박물관 버튼 -->
            <button id="museumButton">박물관</button>
            <!-- 미술관 버튼 -->
            <button id="artMuseumButton">미술관</button>
            <!-- 유적지 버튼 -->
            <button id="historicalSiteButton">유적지</button>
        </div>
        <!-- 공원 컨테이너 -->
        <div id="parkPlacesContainer">
            <!-- 데이터베이스에서 가져온 공원 데이터를 표시할 컨테이너 -->
            <div class="row">
                <!-- 공원 데이터 순회 -->
                <c:forEach items="${parkPlaces}" var="parkPlace">
                    <a class="square-box" href="themeDetail?id=${parkPlace.id}">
                        <!-- 이미지와 이름 표시 -->
                        <img src="${parkPlace.imgAdr}" alt="이미지">
                        <p>${parkPlace.name}</p>
                    </a>
                </c:forEach>
            </div>
        </div>
        <div id="recreationalForestsContainer">
            <!-- 데이터베이스에서 가져온 recreationalForests를 보여줄 컨테이너 -->
            <div class="row">
                <!-- 데이터베이스에서 검색한 데이터를 순회합니다. -->
                <!-- 'recreationalForests'는 데이터베이스에서 가져온 'recreationalForest' 객체 목록을 가정합니다. -->
                <c:forEach items="${recreationalForests}" var="recreationalForest">
                    <a class="square-box" href="themeDetail?id=${recreationalForest.id}">
                        <!-- <img> 태그의 'src' 속성을 'recreationalForest' 객체의 'imgAdr' 필드 값으로 채웁니다. -->
                        <img src="${recreationalForest.imgAdr}" alt="이미지">
                        <!-- <p> 태그의 내용을 'recreationalForest' 객체의 'name' 필드 값으로 채웁니다. -->
                        <p>${recreationalForest.name}</p>
                    </a>
                </c:forEach>
            </div>
        </div>
        <div id="museumContainer">
            <!-- 데이터베이스에서 가져온 museum 데이터를 표시할 컨테이너 -->
            <div class="row">
                <!-- 박물관 데이터 순회 -->
                <c:forEach items="${museums}" var="museum">
                    <a class="square-box" href="themeDetail?id=${museum.id}">
                        <!-- 이미지와 이름 표시 -->
                        <img src="${museum.imgAdr}" alt="이미지">
                        <p>${museum.name}</p>
                    </a>
                </c:forEach>
            </div>
        </div>
        <div id="artMuseumContainer">
            <!-- 데이터베이스에서 가져온 artMuseum 데이터를 표시할 컨테이너 -->
            <div class="row">
                <!-- 공원 데이터 순회 -->
                <c:forEach items="${artMuseums}" var="artMuseum">
                    <a class="square-box" href="themeDetail?id=${artMuseum.id}">
                        <!-- 이미지와 이름 표시 -->
                        <img src="${artMuseum.imgAdr}" alt="이미지">
                        <p>${artMuseum.name}</p>
                    </a>
                </c:forEach>
            </div>
        </div>
        <div id="historicalSiteContainer">
            <!-- 데이터베이스에서 가져온 museum 데이터를 표시할 컨테이너 -->
            <div class="row">
                <!-- 공원 데이터 순회 -->
                <c:forEach items="${historicalSites}" var="historicalSite">
                    <a class="square-box" href="themeDetail?id=${historicalSite.id}">
                        <!-- 이미지와 이름 표시 -->
                        <img src="${historicalSite.imgAdr}" alt="이미지">
                        <p>${historicalSite.name}</p>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
