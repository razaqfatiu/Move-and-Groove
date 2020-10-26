class AddUserIdToActivityRecord < ActiveRecord::Migration[6.0]
  def change
    add_reference :activity_records, :user_id, foreign_key: true
  end
end
