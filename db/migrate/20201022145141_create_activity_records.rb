class CreateActivityRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_records do |t|
      t.date :Date
      t.time :duration
      t.text :comment

      t.timestamps
    end
  end
end
