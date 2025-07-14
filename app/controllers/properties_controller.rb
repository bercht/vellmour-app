class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  def index
    @properties = Property.includes(:neighborhood).all
    @neighborhoods = Neighborhood.all
  end

  def show
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
end