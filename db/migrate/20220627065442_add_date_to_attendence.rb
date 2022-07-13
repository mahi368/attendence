class AddDateToAttendence < ActiveRecord::Migration[5.2]
  def change
    add_column :attendences, :date, :datetime
  end
end
