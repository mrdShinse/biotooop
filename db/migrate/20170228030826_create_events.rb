class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table(:events, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.date :date
      t.integer :type
      t.string :area
      t.time :meeting_time
      t.string :meeting_place
      t.integer :user_count

      t.timestamps
    end
  end
end
