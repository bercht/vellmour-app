# config/initializers/geocoder.rb

Geocoder.configure(
  # Geocoding service
  lookup: :google,

  # API key for Google Maps
  api_key: Rails.application.credentials.dig(:Maps, :api_key),

  # Unidades (km ou mi)
  units: :km
)