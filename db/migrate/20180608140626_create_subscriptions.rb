class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :feedUrl
      t.string :title
      t.string :description
      t.string :link
      t.string :generator
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
