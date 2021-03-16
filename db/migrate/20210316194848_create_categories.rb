class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :Name, null: false, unique: true
      t.integer :Priority, null: false, unique: true

      t.timestamps null: false
    end
    add_index :categories, :Name, unique: true
    add_index :categories, :Priority, unique: true
  end
end
