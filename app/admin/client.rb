ActiveAdmin.register Client do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :order, :image, :image_file_name, :image_content_type,
                :image_file_size, :image_updated_at

  form do |f|
    f.semantic_errors 
    f.inputs "Details" do 
      f.input :name
      f.input :order, as: :number
    end
   
    f.inputs "Image" do
      f.input :image, as: :file, hint: f.template.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  show do
    panel "Asset details" do
      attributes_table_for client do
        row :order
        row :image { |a| image_tag a.image.url(:thumb) }
        row :image_original { |a| link_to 'Original', a.image.url(:original) } 
        row :image_big { |a| link_to 'Big', a.image.url(:big) } 
        row :image_thumb { |a| link_to 'Thumb', a.image.url(:thumb) } 
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :image do |client|
      link_to image_tag(client.image.url(:thumb)), admin_client_url(client)
    end
    column :order
    actions defaults: true
  end
end
