class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :name
      t.string :image
      t.string :title
      t.integer :value
      t.integer :comment_count
      t.integer :favorite_count
      t.integer :user_number
      t.integer :post_number

      t.timestamps
    end
  end
end
