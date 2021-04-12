class AddCountryToAirline < ActiveRecord::Migration[6.1]
  def change
    add_column :airlines, :country, :string
  end
end
