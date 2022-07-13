class CreateUserStandards < ActiveRecord::Migration[5.2]
  def change
    create_table :user_standards do |t|
      t.references :user, foreign_key: true
      t.references :standard, foreign_key: true

      t.timestamps
    end
  end
end
