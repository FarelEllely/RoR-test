class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :image
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
