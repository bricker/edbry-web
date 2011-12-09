class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :url
      t.text :information
      t.timestamps
    end
  end
end
