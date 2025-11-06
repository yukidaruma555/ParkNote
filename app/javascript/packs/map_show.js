let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker") // 追記

  const mapArea = document.getElementById("map")

  const latitude = parseFloat(mapArea.dataset.latitude);
  const longitude = parseFloat(mapArea.dataset.longitude);

  if (latitude == 0 && longitude == 0) {
    mapArea.classList.add("d-flex", "justify-content-center", "align-items-center")
    mapArea.innerHTML = "<h3>Map情報がありません。</h3>"
  } else {
    map = new Map(mapArea, {
      center: { lat: latitude, lng: longitude },
      zoom: 15,
      mapId: "DEMO_MAP_ID", // 追記
      mapTypeControl: false
    });
  
    const marker = new google.maps.marker.AdvancedMarkerElement ({
      position: { lat: latitude, lng: longitude },
      map,
      // 他の任意のオプションもここに追加可能
    });
  }
}

initMap()