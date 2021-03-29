class AddCounterCacheColums < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :votes_count, :integer
    add_column :users, :articles_count, :integer
    add_column :users, :votes_count, :integer
  end
end
