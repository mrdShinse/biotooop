class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table(:tags, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.text :name

      t.timestamps
    end
  end
end
