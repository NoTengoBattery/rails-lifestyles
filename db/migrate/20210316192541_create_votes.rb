class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :ArticleId, null: false
      t.integer :UserId, null: false

      t.timestamps null: false
    end
    add_index :votes, :ArticleId
    add_index :votes, :UserId
  end
end
