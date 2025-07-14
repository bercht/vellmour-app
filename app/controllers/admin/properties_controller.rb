class Admin::PropertiesController < Admin::BaseController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.includes(:neighborhood).all
  end

  def show
  end

  def new
    @property = Property.new
    @neighborhoods = Neighborhood.all
  end

  def create
    @property = Property.new(property_params)
    @neighborhoods = Neighborhood.all
    
    if @property.save
      redirect_to admin_properties_path, notice: 'Propriedade criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @neighborhoods = Neighborhood.all
  end

  def update
    @neighborhoods = Neighborhood.all
    
    if @property.update(property_params)
      redirect_to admin_properties_path, notice: 'Propriedade atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    redirect_to admin_properties_path, notice: 'Propriedade deletada com sucesso.'
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :price, :description, :neighborhood_id, images: [])
  end
end