class RemoveColumnFromStandard < ActiveRecord::Migration[5.2]
  def change
    remove_reference :standards, :user, foreign_key: true
  end
end
