ActiveAdmin.register Post do

  permit_params :name, :description, :short_description, :post_type, assets_attributes: [:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :id, :_destroy]

  form multipart: true do |f|

    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :short_description
      f.input :post_type, as: :select, collection: Post.post_types, include_blank: false
    end

    f.inputs 'Images' do
      f.has_many :assets do |a|
        if a.object.new_record?
          a.input :image, as: :file, hint: "Image is not uploaded yet"
        else 
          a.input :image, as: :file, hint: a.template.image_tag(a.object.image.url(:thumb))
          a.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
        end
      end
    end
    f.actions
  end

end


