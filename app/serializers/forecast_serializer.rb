class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :current, :hourly, :daily
end
