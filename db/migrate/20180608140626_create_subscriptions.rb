class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :url
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
