class AddAddressToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :street, :string
    add_column :profiles, :suburb, :string
    add_column :profiles, :postcode, :string
    add_column :profiles, :state, :string
    add_column :profiles, :country, :string
  end
end
