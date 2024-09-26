class AddColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :postalcode, :string
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
