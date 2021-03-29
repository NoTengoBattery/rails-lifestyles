class RemoveImageColumFromArticle < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :Image
  end
end
