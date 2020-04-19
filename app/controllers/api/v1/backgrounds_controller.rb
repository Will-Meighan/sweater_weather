class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: ImageSerializer.new(Image.new(params[:location]))
  end
end
