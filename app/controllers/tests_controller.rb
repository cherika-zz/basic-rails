class TestsController < ApplicationController
  def index
  	@tests = Advertisement.all
  end

  def show
  	@test = Advertisement.find(params[:id])
  end
end
