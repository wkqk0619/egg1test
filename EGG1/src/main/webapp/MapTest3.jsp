<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>   
<html>   
<head>   
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>   
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>   
<title>Google Maps JavaScript API v3 Example: Geocoding Simple</title>   
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />   
<!-- <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>    -->
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
    var latlng = new google.maps.LatLng(36.9, 127.7);  
    var myOptions = {  
        zoom: 7,  
        center: latlng,  
        mapTypeId: google.maps.MapTypeId.ROADMAP  
    }  
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);  
    
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
  
</script>   
<style type="text/css">
#map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      table {
        font-size: 12px;
      }
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
</style>
</head>   
<body onload="initialize()">   
<div>   
    <input id="address" type="text"  placeholder="주소를 입력해주세요">   
    <input type="button" value="Geocode" onclick="codeAddress()">   
</div>   
<div id="r"></div>    
<div id="map_canvas" style="height:90%;top:30px"></div>  

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
</body>   
</html>  