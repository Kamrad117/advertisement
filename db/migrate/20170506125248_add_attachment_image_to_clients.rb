class AddAttachmentImageToClients < ActiveRecord::Migration[5.1]
  def self.up
    change_table :clients do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :clients, :image
  end
end
