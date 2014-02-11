ActiveAdmin.register Event do

  permit_params :name, :venue, :street_address, :city, :state_province, :zip_code, :publish_at,
    :geocode_lat, :geocode_lng, :admission_info, :description, tags_attributes: [:id, :starts_at, :ends_at, :_destroy]

  sidebar "Event Dates", only: [:show, :edit] do
    ul do
      li link_to "Dates", admin_event_event_dates_path(event)
      li link_to "Categories", admin_event_event_categories_path(event)
      li link_to "Vendors", admin_event_event_vendors_path(event)
    end
  end

  controller do
    def test
      # @authors = Author.find_by_query params[:query]
      render :template => 'admin/events/test'
    end
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
