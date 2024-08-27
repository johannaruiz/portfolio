# frozen_string_literal: true

# Adding inquiries for messages submitted via contact form
class AddInquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :inquiries do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :message, null: false
      t.integer :type, default: 0, null: false
      t.string :phone
      t.string :company
      t.timestamps
    end
  end
end
