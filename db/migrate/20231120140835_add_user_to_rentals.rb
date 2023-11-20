class AddUserToRentals < ActiveRecord::Migration[7.1]
  def change
    add_reference :rentals, :user, foreign_key: true
    add_reference :bots, :user, foreign_key: true
  end
end
