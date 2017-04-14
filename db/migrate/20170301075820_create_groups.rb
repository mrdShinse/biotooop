class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table(:groups, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.integer :event_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
