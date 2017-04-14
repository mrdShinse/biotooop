class CreateUserEvents < ActiveRecord::Migration[5.0]
  def change
    create_table(:user_events, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
