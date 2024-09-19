class RemoveColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :postalcode, :string
    remove_column :users, :address, :string
    remove_column :users, :profile, :text
  end
end
