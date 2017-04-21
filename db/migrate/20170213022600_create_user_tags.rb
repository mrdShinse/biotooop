class CreateUserTags < ActiveRecord::Migration[5.0]
  def change
    create_table(:user_tags, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :user_tags, :user_id
    add_index :user_tags, :tag_id
    add_index :user_tags, [:user_id, :tag_id], unique: true
  end
end
