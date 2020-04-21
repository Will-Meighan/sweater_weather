class Api::V1::RoadTripsController < ApplicationController

  def create
    if authenticate
      render json: RoadTripSerializer.new(RoadTripFacade.new(params["origin"], params["destination"]))
    else
      render :json => { :errors => "unauthorized" }, :status => 401
    end
  end

  private

    def authenticate
      user = User.find_by(api_key: params["api_key"])
    end
end
