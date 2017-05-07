class ChangePublishToSlides < ActiveRecord::Migration[5.1]
  def change
    rename_column :slides, :publuish, :publish
  end
end
