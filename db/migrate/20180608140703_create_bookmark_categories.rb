class CreateBookmarkCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmark_categories do |t|
      t.references :category, index: true, foreign_key: true
      t.references :bookmark, index: true, foreign_key: true
      t.timestamps
    end
  end
end
