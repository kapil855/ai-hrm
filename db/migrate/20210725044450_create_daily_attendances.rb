class CreateDailyAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_attendances do |t|
      t.date :attendance_date
      t.datetime :in_time
      t.datetime :out_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
