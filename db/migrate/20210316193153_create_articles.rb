class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :AuthorId, null: false
      t.integer :CategoryId, null: false
      t.string :Title, null: false, unique: true
      t.text :Text, null: false
      t.string :Image, null: false
      t.date :CreatedAt, null: false

      t.timestamps null: false
    end
    add_index :articles, :CategoryId
    add_index :articles, :Title, unique: true
    add_index :articles, :CreatedAt
  end
end
