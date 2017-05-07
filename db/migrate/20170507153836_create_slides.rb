class CreateSlides < ActiveRecord::Migration[5.1]
  def change
    create_table :slides do |t|
      t.string :title
      t.text :text
      t.integer :slide_show_id
      t.integer :post_id

      t.timestamps
    end
  end
end
