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
  permit_params :name, :map, :about, :slug, bikeroutes: [:id, :name]

  around_filter do |controller, action|
    Neighborhood.class_eval do
      alias :__active_admin_to_param :to_param
      def to_param() id.to_s end
    end

    begin
      action.call
    ensure
      Neighborhood.class_eval do
        alias :to_param :__active_admin_to_param
      end
    end
  end

  # controller do
  #   def find_resource
  #     scoped_collection.friendly.find(params[:id])
  #   end
  # end

  index do
    column :name
    column :map
    column :slug
    column :bikeroutes do |neighborhood|
      neighborhood.bikeroutes.map{ |bikeroute| bikeroute.name }.join(', ')
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :map
      row :slug
      row :about
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
      f.input :slug
      f.input :about
      f.input :bikeroutes, :as => :check_boxes
    end
    f.actions
  end

end
