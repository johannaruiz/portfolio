# frozen_string_literal: true

# Adding Posts to the application
class AddPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :slug, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end

    add_index :posts, :slug, unique: true
  end
end
