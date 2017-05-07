ActiveAdmin.register Asset do

  permit_params :post_id, :image, 
                :image_file_name, :image_content_type, :image_file_size, 
                :image_updated_at

  form do |f|
    f.semantic_errors 
    f.inputs "Details" do 
      f.input :post, as: :select, include_blank: true, collection: Client.all
      unless f.object.new_record? 
        li "Image file name #{f.object.image_file_name}"
        li "Image content type #{f.object.image_content_type}"
        li "Image file size #{f.object.image_file_size}"
      end
    end
   
    f.inputs "Image" do
      f.input :image, as: :file, hint: f.template.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  show do
    panel "Asset details" do
      attributes_table_for asset do
        row :post_id { |a| link_to asset.post.name, admin_post_url(asset.post) } 
        row :image { |a| image_tag a.image.url(:medium) }
        row :image_original { |a| link_to 'Original', a.image.url(:original) } 
        row :image_big { |a| link_to 'Big', a.image.url(:big) } 
        row :image_thumb { |a| link_to 'Thumb', a.image.url(:thumb) } 
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :image do |asset|
      link_to image_tag(asset.image.url(:thumb)), admin_asset_url(asset)
    end
    column :post_id { |asset| link_to asset.post.name, admin_post_url(asset.post) } 
    actions defaults: true
  end

end
