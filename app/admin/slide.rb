ActiveAdmin.register Slide do

  permit_params :title, :text, :post_id, :order, :publish, :image, 
                :image_file_name, :image_content_type, :image_file_size, 
                :image_updated_at

  form do |f|
    f.semantic_errors 
    f.inputs "Details" do 
      f.input :title
      f.input :text, as: :text
      f.input :post_id, as: :select, include_blank: false, hint: 'Post', collection: Post.all
      f.input :order, as: :number
      f.input :publish
    end
    f.inputs "Image" do 
      f.input :image, as: :file, hint: f.template.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  show do
    panel "Slide details" do
      attributes_table_for slide do
        row :title
        row :text 
        row :publish
        row :order
        row :post_id { |s| link_to s.post.name ,admin_post_url(s.post_id) } 
        row :image_original { |s| link_to 'Original', s.image.url(:original) } 
        row :image_big { |s| link_to 'Big', s.image.url(:big) } 
        row :image_thumb { |s| link_to 'Thumb', s.image.url(:thumb) } 
        row :image { |s| image_tag s.image.url(:medium) }
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :image do |slide|
      link_to image_tag(slide.image.url(:thumb)), admin_slide_url(slide)
    end
    column :publish
    column :order
    column :title { |slide| link_to slide.title, admin_slide_url(slide)  }
    column :text
    column :post 
    actions defaults: true
  end

end
