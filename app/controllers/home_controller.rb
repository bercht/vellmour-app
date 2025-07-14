class HomeController < ApplicationController
  def index
    @featured_properties = Property.includes(:neighborhood)
                                  .where.not(images: { id: nil })
                                  .joins(:images_attachments)
                                  .limit(3)
                                  .order(created_at: :desc)
    @neighborhoods = Neighborhood.all
  end
end