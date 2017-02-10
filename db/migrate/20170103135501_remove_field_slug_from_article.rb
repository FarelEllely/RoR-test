class RemoveFieldSlugFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :slug
  end
end
