ActiveAdmin.register Neighborhood do

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
  permit_params :name, :map, bikeroutes: [:id, :name]

  index do
    column :name
    column :map
    column :bikeroutes do |neighborhood|
      neighborhood.bikeroutes.map{ |bikeroute| bikeroute.name }.join(', ')
    end
    actions
  end


  show do
    attributes_table do
      row :name
      row :map
      row :bikeroutes do |neighborhood|
        neighborhood.bikeroutes.map{ |bikeroute| bikeroute.name }.join(', ')
      end
    end
    #active_admin_comments
  end


  form do |f|
    f.inputs "Route Details" do
      f.input :name
      f.input :map
      f.input :bikeroutes, :as => :check_boxes
    end
    f.actions
  end

end
