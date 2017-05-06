class AddAssetIdToAssets < ActiveRecord::Migration[5.1]
  def change
    add_reference :assets, :client
  end
end
