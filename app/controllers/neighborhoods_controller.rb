class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show]

  def show
    @properties = @neighborhood.properties
  end

  private

  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end
end