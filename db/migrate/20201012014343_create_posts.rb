class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :value, null: false
      t.boolean :is_report, null: false, default: false

      t.timestamps
    end
  end
end
