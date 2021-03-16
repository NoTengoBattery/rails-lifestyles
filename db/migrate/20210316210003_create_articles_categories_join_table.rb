class CreateArticlesCategoriesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :articles, :categories do |t|
      t.index :article_id
      t.index :category_id
    end
  end
end
