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

  permit_params :name, :description, :lane_type, :grade, :distance, neighborhoods: [:id, :name]

  index do
    column :name
    column :description
    column :lane_type
    column :grade
    column :distance
    column :neighborhoods do |bikeroute|
      bikeroute.neighborhoods.map{ |neighborhood| neighborhood.name }.join(', ')
    end
    actions
  end


end
