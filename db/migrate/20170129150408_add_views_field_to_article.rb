class AddViewsFieldToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :views, :integer, :default => 0
  end
end
