class AddPostIdToAsset < ActiveRecord::Migration[5.1]
  def change
    add_reference :assets, :post
  end
end
