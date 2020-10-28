class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.text :comment, null: false
      t.boolean :is_report, null: false, default: false

      t.timestamps
    end
  end
end
