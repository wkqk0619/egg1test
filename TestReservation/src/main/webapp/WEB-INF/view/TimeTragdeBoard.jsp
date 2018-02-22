<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시간 거래소 페이지</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaSHdRj4Eb_hI5fJOq1Uqor3w1c1TQmXs&libraries=places"></script>
<script type="text/javascript">
var geocoder;  
var map;  
var marker;  
var places, infoWindow;
//var hostnameRegexp = new RegExp('^https?://.+?/');
var hostnameRegexp = new RegExp('^https?:\/\/.+?\/');
var countries = {
        'kr': {
            center: {lat: 36.9, lng: 127.7},
            zoom: 7
          }
      };
var autocomplete;
var countryRestrict = {'country': 'kr'};      
  
function initialize(){  
    geocoder = new google.maps.Geocoder();  
    //var latlng = new google.maps.LatLng(36.9, 127.7);  
    var latlng = new google.maps.LatLng(36.9, 127.7);  
    
    var myOptions = {  
        zoom: 7,  
        center: latlng,
        zoomControl: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP  
    }  
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);  
    google.maps.event.addListener(map, 'click', function(event) {
        placeMarker(event.latLng);
      });
    autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */ (
                document.getElementById('address')), {
             // types: ['(cities)'],
             	//types: ['(cities)'],
              componentRestrictions: countryRestrict
            });
        places = new google.maps.places.PlacesService(map);
        
        infoWindow = new google.maps.InfoWindow({
            content: document.getElementById('info-content')
          });

        autocomplete.addListener('place_changed', onPlaceChanged);
}  

function placeMarker(location) {
	 if(typeof marker!='undefined'){  
	        marker.setMap(null);  
	    }  
	  marker = new google.maps.Marker({
	      position: location, 
	      map: map
	  });
	  map.setCenter(location);
}

function onPlaceChanged() {
    var place = autocomplete.getPlace();
    if (place.geometry) {
      map.panTo(place.geometry.location);
      map.setZoom(20);
      //search();
      codeAddress();
    } else {
      document.getElementById('address').placeholder = '검색어를 입력해주시기 바랍니다.';
    }
  }
  
function codeAddress(){  
    var address = document.getElementById("address").value;  
    var r = document.getElementById("r");  
      
    r.innerHTML = '';  
      
    geocoder.geocode({  
        'address': address  
    }, function(results, status){  
        if (status == google.maps.GeocoderStatus.OK) {  
            map.setCenter(results[0].geometry.location); 
            
            addMark(results[0].geometry.location.lat(), results[0].geometry.location.lng());  
            marker.placeResult = results[0];
            google.maps.event.addListener(marker, 'click', showInfoWindow);           
            for(var i in  results){  
                //r.innerHTML += results[i].formatted_address+',';  
                var li = document.createElement('li');  
                var a = document.createElement('a');  
                a.href = "javascript:addMark(" + marker.position.lat() + ", " + marker.position.lng() + ");";  
                a.innerHTML = results[i].formatted_address;  
   
                li.appendChild(a);  
                r.appendChild(li);  
            }             
        } else {  
            r.innerHTML = "검색 결과가 없습니다."+status;              
        }  
    });  
}  
  
function addMark(lat, lng){  
    if(typeof marker!='undefined'){  
        marker.setMap(null);  
    }  
      
    marker = new google.maps.Marker({  
        map: map,  
        position: new google.maps.LatLng(lat, lng)  
    });  
}  


	function showInfoWindow() {
	
    	var marker = this;
    	places.getDetails({placeId: marker.placeResult.place_id},
       	 function(place, status) {
        	  if (status !== google.maps.places.PlacesServiceStatus.OK) {
          	  return;
         	 }
          	infoWindow.open(map, marker);
          	buildIWContent(place);
        });
  	}

  // Load the place information into the HTML elements used by the info window.
  function buildIWContent(place) {
    document.getElementById('iw-icon').innerHTML = '<img class="hotelIcon" ' +
        'src="' + place.icon + '"/>';
    document.getElementById('iw-url').innerHTML = '<b><a href="' + place.url +
        '">' + place.name + '</a></b>';
    document.getElementById('iw-address').textContent = place.vicinity;

    if (place.formatted_phone_number) {
      document.getElementById('iw-phone-row').style.display = '';
      document.getElementById('iw-phone').textContent =
          place.formatted_phone_number;
    } else {
      document.getElementById('iw-phone-row').style.display = 'none';
    }

    // Assign a five-star rating to the hotel, using a black star ('&#10029;')
    // to indicate the rating the hotel has earned, and a white star ('&#10025;')
    // for the rating points not achieved.
    if (place.rating) {
      var ratingHtml = '';
      for (var i = 0; i < 5; i++) {
        if (place.rating < (i + 0.5)) {
          ratingHtml += '&#10025;';
        } else {
          ratingHtml += '&#10029;';
        }
      document.getElementById('iw-rating-row').style.display = '';
      document.getElementById('iw-rating').innerHTML = ratingHtml;
      }
    } else {
      document.getElementById('iw-rating-row').style.display = 'none';
    }

    // The regexp isolates the first part of the URL (domain plus subdomain)
    // to give a short URL for displaying in the info window.
    if (place.website) {
      var fullUrl = place.website;
      var website = hostnameRegexp.exec(place.website);
      if (website === null) {
        website = 'http://' + place.website + '/';
        fullUrl = website;
        //alert(fullUrl);
      }
      document.getElementById('iw-website-row').style.display = '';
      document.getElementById('iw-website').textContent = website;
    } else {
      document.getElementById('iw-website-row').style.display = 'none';
    }
  }
  function NewQuestFormShow()
  {
	  $('#NewQuestForm').toggle();
  }
  
  function positShow()
  {
	  alert(map.getCenter());
  }
</script>
<style type="text/css">
	      #map {
        width: 440px;
      }
      #listing {
        position: absolute;
        width: 200px;
        height: 470px;
        overflow: auto;
        left: 442px;
        top: 0px;
        cursor: pointer;
        overflow-x: hidden;
      }
      #findhotels {
        position: absolute;
        text-align: right;
        width: 100px;
        font-size: 14px;
        padding: 4px;
        z-index: 5;
        background-color: #fff;
      }
      #locationField {
        position: absolute;
        width: 190px;
        height: 25px;
        left: 108px;
        top: 0px;
        z-index: 5;
        background-color: #fff;
      }
      #controls {
        position: absolute;
        left: 300px;
        width: 140px;
        top: 0px;
        z-index: 5;
        background-color: #fff;
      }
      #autocomplete {
        width: 100%;
      }
      #country {
        width: 100%;
      }
      .placeIcon {
        width: 20px;
        height: 34px;
        margin: 4px;
      }
      .hotelIcon {
        width: 24px;
        height: 24px;
      }
      #resultsTable {
        border-collapse: collapse;
        width: 240px;
      }
      #rating {
        font-size: 13px;
        font-family: Arial Unicode MS;
      }
      .iw_table_row {
        height: 18px;
      }
      .iw_attribute_name {
        font-weight: bold;
        text-align: right;
      }
      .iw_table_icon {
        text-align: right;
      }
      #map {
        height: 100%;
      }
            html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map_canvas
      {
      	width: 600px;
      	height: 600px;
      }

</style>
</head>
<body  onload="initialize()">
<button type="button" onclick="location='./userLogout.do'">로그아웃</button>
<button type="button" onclick="location='./userMain.do'">유저메인화면으로</button>
<h1>시간 거래소 페이지</h1>
<pre>
	시간 거래소 게시판
	시간 구매(시간 삽니다~~) 퀘스트 글은 등록 및 삭제
	글을 잘못올렸다면 등록된 글을 삭제후 다시 작성한다.
	시간 거래소에 퀘스트 글 작성은 가입한 유저면 누구나 작성이 가능하다
	
	시간 판매자 : 시간 판매자는 거래소 게시글에 올라온 [시간삽니다~] 글을 확인해서
	마음에 드는 것에 시간을 판매 할 수 있다 
</pre>
<button type="button" onclick="NewQuestFormShow()">퀘스트 생성</button>
<button type="button" onclick="location='./reportBoard.do'">신고하러 가기</button>
<div id="NewQuestForm" hidden="hidden">
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>퀘스트 명 : </th><td><input type="text" name="title" placeholder="퀘스트 명을 적어주세요"/></td>
			</tr>
			<tr>
				<th>수행 시각 : </th><td> 몇 월 몇일 시간</td>
			</tr>
			<tr>
				<th>퀘스트 내용 : </th><td><textarea rows="10" cols="30" name="content" placeholder="퀘스트 내용을 적어주세요"></textarea></td>
			</tr>
			<tr>
				<th>모집 인원 : </th><td><input type="text" placeholder="모집인원을 적어주세요"/></td>
			</tr>
			<tr>
				<th>지급방식 : </th>
				<td>
					<input type="radio" name="payType" value="money"/> 현금
					<input type="radio" name="payType" value="creditcard"/>카드결제
					<input type="radio" name="payType" value="bank"/>계좌이체
				</td>
			</tr>
			<tr>
				<th>시간당 지급 금액 : </th><td><input type="text" name="pay" placeholder="시간당 지급 금액을 적어주세요 최저는 1만원"/></td>
			</tr>
			<tr>
				<th>모집 제한 : </th>
				<td>연령 : <select name="age">
								<option value="All" selected="selected">연령 무관</option>
								<option value="10">20대 미만</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">60대 이상</option>
						  </select>, 
				성별 : <input type="radio" name="gender" value="All"/> 상관없음 <input type="radio" name="gender" value="Man"/> 남성 <input type="radio" name="gender" value="Won"/> 여성
				</td>
			</tr>
			<tr>
				<th>구글 지도</th>
				<td>
					<div>   
    					<input id="address" type="text"  placeholder="주소를 입력해주세요">   
    					<input type="button" value="Geocode" onclick="codeAddress()" hidden="hidden">   
					</div>   
					<div id="r"></div>    
					<div id="map_canvas"></div>  

					<div style="display: none">
      					<div id="info-content">
        					<table>
          						<tr id="iw-url-row" class="iw_table_row">
            						<td id="iw-icon" class="iw_table_icon"></td>
            						<td id="iw-url"></td>
          						</tr>
          						<tr id="iw-address-row" class="iw_table_row">
            						<td class="iw_attribute_name">Address:</td>
            						<td id="iw-address"></td>
          						</tr>
          						<tr id="iw-phone-row" class="iw_table_row">
            						<td class="iw_attribute_name">Telephone:</td>
           							<td id="iw-phone"></td>
          						</tr>
          						<tr id="iw-rating-row" class="iw_table_row">
            						<td class="iw_attribute_name">Rating:</td>
            						<td id="iw-rating"></td>
          						</tr>
          						<tr id="iw-website-row" class="iw_table_row">
            						<td class="iw_attribute_name">Website:</td>
            						<td id="iw-website"></td>
          						</tr>
        					</table>
      					</div>
    				</div> 
				</td>
			</tr>
			<tr>
          		<th>좌표 출력 : </th><td><button type="button" onclick="positShow()">좌표출력</button></td>
          	</tr>
          	<tr>
          		<th>퀘스트 작성 : </th><td><input type="submit" value="퀘스트 작성"/></td>
          	</tr>
		</table>
	</form>
</div>
</body>
</html>