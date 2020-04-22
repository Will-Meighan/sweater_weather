class MunchieFacade
  attr_reader :id

  def initialize(params)
    @start = params[:start]
    @end = params[:end]
    @food = params[:food]
    @id = nil
  end

end
