ActiveAdmin.register Client do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :order, :image

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
