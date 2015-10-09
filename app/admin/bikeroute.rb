ActiveAdmin.register Bikeroute do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  permit_params :name, :description, :lane_type, :grade, :distance, :map, :geojson, :twitter_tag, :twitter_search, neighborhood_ids: [], neighborhoods: [:id, :name]

  index do
    column :name
    column :lane_type
    column :grade
    column :distance
    column :neighborhoods do |bikeroute|
      bikeroute.neighborhoods.map{ |neighborhood| neighborhood.name }.join(', ')
    end
    actions
  end


  show do
    attributes_table do
      row :name
      row :description
      row :lane_type
      row :grade
      row :distance
      row :map
      row :geojson
      row :neighborhoods do |bikeroute|
        bikeroute.neighborhoods.map{ |neighborhood| neighborhood.name }.join(', ')
      end
    end
    #active_admin_comments
  end


  form do |f|
    f.inputs "Route Details" do
      f.input :name
      f.input :description
      f.input :lane_type
      f.input :grade
      f.input :map
      f.input :geojson
      f.input :distance
      f.input :twitter_tag
      f.input :twitter_search
      f.input :neighborhoods, :as => :check_boxes
    end
    f.actions
  end
end
