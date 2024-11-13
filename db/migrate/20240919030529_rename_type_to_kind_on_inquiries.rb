class RenameTypeToKindOnInquiries < ActiveRecord::Migration[7.1]
  def change
    rename_column :inquiries, :type, :kind
  end
end
