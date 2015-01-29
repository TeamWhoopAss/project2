= require jquery
= require jquery_ujs
= require turbolinks
= require_tree

<!DOCTYPE html>
<html>
<head>
  <title> Hoop Hop </title>
  <script src='https://code.jquery.com/jquery-1.11.1.js'></script>
  <script src='https://api.tiles.mapbox.com/mapbox.js/v2.1.4/mapbox.js'></script>
<link href='https://api.tiles.mapbox.com/mapbox.js/v2.1.4/mapbox.css' rel='stylesheet' />
<style>
  body { text-align: center; position: absolute; margin: 0 auto; padding: 0; height: 100%; text-align: middle; width: 100% }
  #map { 
    margin: 0 auto;
    height:500px;
    width: 500px;
  }
 .circle-text {
    width: 100%;
    height: 100%;
    border-radius: 100%;
    background-color: black;
    background-image: 
        radial-gradient(center, rgba(255,255,255,1) 100%, rgba(255,255,255,1) 50%, rgba(255,255,255,0) 50%),
        linear-gradient(top, rgba(0,0,0,1) 100%, rgba(113,113,114,1) 100%);
    background-size: 128px 128px, 100%, 100%;
    background-position: center -54px, left top;
    background-repeat: no-repeat, repeat;
    z-index: 1;
};

</style>
</head>
<body>
	<h1>AroundandDown<h1>
   <div id ='map' class = 'circle-text'></div>
    <script>
  // Provide your access token
  L.mapbox.accessToken = 'pk.eyJ1IjoiamtkYWxlODkiLCJhIjoialpaRW51cyJ9.jmr9kb5-W3PSFSP9y24RbA';
  // Create a map in the div #map
  var map = L.mapbox.map('map', 'jkdale89.l2l2p32i')
  map.featureLayer.on("ready", function (){
  	.setview(37.74, -122.458, 11);
  };
  
  </script>
</div>

</body>
</html>
