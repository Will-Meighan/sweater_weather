class GeolocationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :lat, :long
end
