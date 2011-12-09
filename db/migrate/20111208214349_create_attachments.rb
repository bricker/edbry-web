class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachable_type
      t.integer :attachable_id
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.timestamps
    end
  end
end
