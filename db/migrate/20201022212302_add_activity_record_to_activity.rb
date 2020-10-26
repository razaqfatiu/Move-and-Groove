class AddActivityToActivityRecord < ActiveRecord::Migration[6.0]
  def change
    add_reference :activity_records, :activity_id, foreign_key: true
  end
end
