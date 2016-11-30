class RemoveFieldFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :image
  end
end
