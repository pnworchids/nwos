ActiveAdmin.register Event do

  permit_params :name, :venue, :venue_space, :street_address, :city, :state_province, :zip_code, :publish_at,
    :geocode_lat, :geocode_lng, :admission_info, :description, :twitter_share, :facebook_share,
    tags_attributes: [:id, :starts_at, :ends_at, :_destroy]

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

  filter :name
  filter :city
  filter :state_province, label: 'State / Province'
  filter :zip_code
  filter :id

  controller do
    def test
      # @authors = Author.find_by_query params[:query]
      render :template => 'admin/events/test'
    end
  end

  sidebar "Dates", only: [:show, :edit] do
    if event.event_dates.present?
      table_for(event.event_dates) do
        column :id
        column :starts_at
        column :ends_at
        column do |e_date|
          span link_to "View", admin_event_event_date_path(event.id, e_date.id), :class => "view_link"
          span link_to "Edit", edit_admin_event_event_date_path(event.id, e_date.id), :class => "edit_link"
        end
      end
    end
    link_to "Add Date".html_safe, new_admin_event_event_date_path(event)
  end

  sidebar "Categories", only: [:show, :edit] do
    if event.event_categories.present?
      table_for(event.event_categories) do
        column :id
        column "Name" do |cat|
          cat.category.name
        end
        column do |e_cat|
          span link_to "View", admin_event_event_date_path(event.id, e_cat.id), :class => "view_link"
          span link_to "Edit", edit_admin_event_event_date_path(event.id, e_cat.id), :class => "edit_link"
        end
      end
    end
    link_to "Add Category".html_safe, new_admin_event_event_category_path(event)
  end

  sidebar "Vendors", only: [:show, :edit] do
    if event.event_vendors.present?
      table_for(event.event_vendors) do
        column :id
        column "Name" do |vendors|
          vendors.vendor.name
        end
        column do |e_vendor|
          span link_to "View", admin_event_event_date_path(event.id, e_vendor.id), :class => "view_link"
          span link_to "Edit", edit_admin_event_event_date_path(event.id, e_vendor.id), :class => "edit_link"
        end
      end
    end
    link_to "Add Vendor".html_safe, new_admin_event_event_vendor_path(event)
  end

  index do
    selectable_column
    column :id
    column "Status" do |event|
      if event.is_published?
        span "published", :class => "status_tag"
      else
        span "pending", :class => "status_tag orange"
      end
    end
    column :name
    default_actions
  end

  show do |event|
    panel "Basic Information" do
      attributes_table_for event do
        row :id
        row "Publish" do
          if event.is_published?
            span "published", :class => "status_tag"
          else
            span "pending", :class => "status_tag orange"
          end
          span event.publish_at
        end
        row :name
        row :description
        row :admission_info
      end
    end

    panel "Location" do
      attributes_table_for event do
        row :venue
        row :venue_space
        row :street_address
        row :city
        row :state_province
        row :zip_code
        row :geocode_lat
        row :geocode_lng
      end
    end

    panel "Sharing" do
      attributes_table_for event do
        row :facebook_share
        row :twitter_share
      end
    end

  end

  form :partial => "form"
  
end
