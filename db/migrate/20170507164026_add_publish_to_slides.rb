class AddPublishToSlides < ActiveRecord::Migration[5.1]
  def change
    add_column :slides, :publuish, :boolean
  end
end
