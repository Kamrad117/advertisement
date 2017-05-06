ActiveAdmin.register Post do

  permit_params :name, :description, :short_description, :type, assets_attributes: [:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :id]

  form multipart: true do |f|

    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :short_description
      f.input :type, as: :select, collection: Post.types, include_blank: false
    end

    f.inputs 'Images' do
      f.has_many :assets, allow_destroy: true, heading: 'Image', new_record: false do |fasset|
        fasset.input :image, as: :file, hint: fasset.template.image_tag(fasset.object.image.url(:thumb))
      end
    end
    f.actions
  end
end
