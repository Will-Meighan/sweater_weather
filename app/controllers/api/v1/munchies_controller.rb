class Api::V1::MunchiesController < ApplicationController
  def index
    render json: MunchieSerializer.new(MunchieFacade.new(start: params[:start], end: params[:end], food: params[:food]))
  end
end
