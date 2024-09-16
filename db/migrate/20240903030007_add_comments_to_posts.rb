# frozen_string_literal: true

# Adding threaded comments to posts
class AddCommentsToPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.text :body, null: false
      t.boolean :approved, default: false, null: false
      t.integer :parent_id
      t.timestamps
    end

    add_index :comments, :parent_id
  end
end
