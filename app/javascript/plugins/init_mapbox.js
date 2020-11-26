import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarker = (map, marker) => {
  new mapboxgl.Marker()
    .setLngLat([ marker.lgn, marker.lat ])
    .addTo(map);
};

const fitMapToMarker = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ marker.lgn, marker.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const marker = JSON.parse(mapElement.dataset.marker);

    addMarker(map, marker);
    fitMapToMarker(map, marker);

    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }));

    map.addControl(new mapboxgl.NavigationControl());

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true
      })
    );
  }
};

export { initMapbox };
