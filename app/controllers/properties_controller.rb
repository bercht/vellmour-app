class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  def index
    @properties = Property.includes(:neighborhood).all
    @neighborhoods = Neighborhood.all
  end

  def show
    # Carregar imóveis relacionados do mesmo bairro (excluindo o atual)
    @related_properties = @property.neighborhood
                                  .properties
                                  .where.not(id: @property.id)
                                  .limit(4)
                                  .order(:created_at)
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
end