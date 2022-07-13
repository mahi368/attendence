class CreateAttendences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.references :user, foreign_key: true
      t.references :standard, foreign_key: true

      t.timestamps
    end
  end
end
