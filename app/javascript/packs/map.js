let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker") // 追記

  const mapArea = document.getElementById("map")
  map = new Map(mapArea, {
    center: { lat: 35.681236, lng: 139.767125 },
    zoom: 8,
    mapId: "DEMO_MAP_ID", // 追記
    mapTypeControl: false
  });

  // 追記
  try {
    const response = await fetch("/parks.json");
    if (!response.ok) throw new Error('Network response was not ok');

    const { data: { items } } = await response.json();
    if (!Array.isArray(items)) throw new Error("Items is not an array");

    const parkIds = JSON.parse(mapArea.dataset.parkIds)
    const filterdItems = items.filter(o => parkIds.includes(o.id) )
    filterdItems.forEach( item => {
      const latitude = item.latitude;
      const longitude = item.longitude;
      const parkName = item.parkName;
      const park_id = item.id;
      const address = item.address;

      if (latitude !== 0 && longitude !== 0) {
        const marker = new google.maps.marker.AdvancedMarkerElement({
          position: { lat: latitude, lng: longitude },
          map,
          title: parkName,
          // 他の任意のオプションもここに追加可能
        });
        map.setCenter({lat: latitude, lng: longitude})

        const infoWindow = new google.maps.InfoWindow({
          position: marker.position,
          pixelOffset: new google.maps.Size(0, -25),
          content: `
            <a href="/parks/${park_id}" data-turbolinks=false class="card d-block" style="text-decoration:none;color:#666;">
              <div class="card-body">
                <h3 class="text-decoration-none">${parkName}</h3>
                <p class="text-decoration-none">${address}</p>
              </div>
            </a>
          `
        })
        marker.addListener('click', (e) => {
          console.log(e)
          infoWindow.open(map)
        })

      }
    });
  } catch (error) {
    console.error('Error fetching or processing post images:', error);
  }
}

initMap()