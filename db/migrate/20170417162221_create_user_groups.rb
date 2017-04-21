class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table(:user_groups, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
