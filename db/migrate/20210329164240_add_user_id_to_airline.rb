class AddUserIdToAirline < ActiveRecord::Migration[6.1]
  def change
    add_reference :airlines, :user, null: false, foreign_key: true
  end
end
