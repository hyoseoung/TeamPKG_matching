<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82348a87cf5aef282648313f9eaf31dc&libraries=services"></script>
<meta charset="UTF-8">
<title>카카오 지도 예제</title>
    <style>
        #map {
            width: 100%;
            height: 500px;
        }
    </style>
</head>
<body>
<div id="map"></div>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=cfdee936e4063fff7c1fd94c2ec3f888&libraries=services"></script>
	<script>
	// Kakao Maps API 초기화
	kakao.maps.load(function() {
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.477013, 127.0016985),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);

		// Geolocation API를 이용하여 현재 위치 정보 얻기
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var latlng = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude);
				// 마커와 인포윈도우 생성
				var marker = new kakao.maps.Marker({
					position: latlng
				});
				var infowindow = new kakao.maps.InfoWindow({
					content: '<div style="padding:5px;">현재 위치</div>'
				});
				// 마커를 지도에 표시하고 인포윈도우 열기
				marker.setMap(map);
				infowindow.open(map, marker);
				// 지도 중심을 현재 위치로 이동
				map.setCenter(latlng);
			}, function() {
				alert('위치 정보를 얻는데 실패했습니다.');
			});
		} else {
			alert('이 브라우저에서는 Geolocation API를 지원하지 않습니다.');
		}
	});
	</script>
</body>
</html>