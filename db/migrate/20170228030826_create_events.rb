class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date :date
      t.integer :type
      t.string :area
      t.time :meeting_time
      t.string :meeting_place

      t.timestamps
    end
  end
end
