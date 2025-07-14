class Admin::Properties::ImagesController < Admin::BaseController
  include ActionView::RecordIdentifier
  
  before_action :set_property
  before_action :set_image

  def destroy
    @image.purge_later
    
    respond_to do |format|
      format.html { redirect_to edit_admin_property_path(@property), notice: 'Imagem removida com sucesso.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@image, :container)) }
    end
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_image
    @image = @property.images.find(params[:id])
  end
end