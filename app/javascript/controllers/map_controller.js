// app/javascript/controllers/map_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    latitude: Number,
    longitude: Number,
    address: String
  }

  connect() {
    if (typeof google === "undefined") {
      // Se a API do Google ainda não foi carregada, a função global window.initMap fará o trabalho
      window.initMap = this.initMap.bind(this)
    } else {
      this.initMap()
    }
  }

  initMap() {
    if (!this.latitudeValue || !this.longitudeValue) {
      console.error("Coordenadas inválidas para o mapa.");
      this.element.innerHTML = '<div class="flex items-center justify-center h-full"><p class="text-center text-gray-500">Endereço não encontrado no mapa.</p></div>';
      return;
    }

    const position = { lat: this.latitudeValue, lng: this.longitudeValue };

    const map = new google.maps.Map(this.element, {
      zoom: 16,
      center: position,
      mapTypeId: "roadmap",
      disableDefaultUI: true, // Opcional: remove controles padrão do mapa
    });

    const marker = new google.maps.Marker({
      position: position,
      map: map,
      title: this.addressValue
    });
  }
}