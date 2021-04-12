class AddPopularityToAirline < ActiveRecord::Migration[6.1]
  def change
    add_column :airlines, :popularity, :integer
  end
end
