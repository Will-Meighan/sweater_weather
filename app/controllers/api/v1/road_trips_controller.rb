class Api::V1::RoadTripsController < ApplicationController
  before_action :authenticate

  def create
    facade = RoadTripFacade.new(params["origin"], params["destination"])

    render json: RoadTripSerializer.new(facade)
  end

  private
    def authenticate
      user = User.find_by(api_key: params["api_key"])

      if user
        @current_user = user
      else
        render :json => { :errors => "unauthorized" }, :status => 401
      end
    end
end
