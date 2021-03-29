class DeleteArticlesCategoryIdColumn < ActiveRecord::Migration[6.1]
  def change
    remove_index :articles, column: :CategoryId
    remove_column :articles, :CategoryId
  end
end
