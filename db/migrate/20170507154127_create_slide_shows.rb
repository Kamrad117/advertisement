class CreateSlideShows < ActiveRecord::Migration[5.1]
  def change
    create_table :slide_shows do |t|
      t.boolean :published

      t.timestamps
    end
  end
end
