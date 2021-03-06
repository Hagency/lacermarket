class AddSlugToContents < ActiveRecord::Migration
  def change
    add_column :contents, :name, :string
    add_column :contents, :slug, :string
    add_index :contents, :slug, unique: true
  end
end
