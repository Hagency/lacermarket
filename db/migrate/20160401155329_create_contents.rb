class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
