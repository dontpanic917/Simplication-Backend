class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.string :headline
      t.string :body
      t.boolean :public
      t.references :user, index:true, foreign_key: true
      t.timestamps
    end
  end
end
