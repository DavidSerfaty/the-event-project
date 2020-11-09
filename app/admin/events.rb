ActiveAdmin.register Event do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :owner_id, :title, :description, :start_date, :duration, :price, :location, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:owner_id, :title, :description, :start_date, :duration, :price, :location]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :owner
    column :title
    column :start_date
    column :duration
    column :price
    column :location
    column :status

    actions
  end

end
