class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :Name, null: false, unique: true

      t.timestamps null: false
    end
    add_index :users, :Name, unique: true
  end
end
