class HomeController < ApplicationController
  def index
    @featured_properties = Property.featured
                                  .includes(:neighborhood)
                                  .order(created_at: :desc)
    @neighborhoods = Neighborhood.all
  end
end