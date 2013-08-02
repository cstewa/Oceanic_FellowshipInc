class AddConfirmNumToSeats < ActiveRecord::Migration
  def change
    add_column :seats, :confirm_number, :string
  end
end
