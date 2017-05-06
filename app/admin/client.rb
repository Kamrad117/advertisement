ActiveAdmin.register Client do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :order, :image

  index do
    selectable_column
    column :image do |client|
      image_tag client.image.url(:thumb)
    end
    column :name, sortable: :name do |client|
      link_to client.name, admin_client_path(client)
    end
    column :order
    column :created_at
    column :updated_at
    actions defaults: true
  end

  form do |f|
    f.semantic_errors

    f.inputs "Details" do
      f.input :name
      f.input :order
      f.input :image, as: :file
    end

    f.actions
  end
end
