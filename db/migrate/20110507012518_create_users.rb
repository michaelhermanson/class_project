class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 40, :null => false
      t.string :motto, :limit => 80
      t.string :pet_name, :limit => 30
      t.string :mood, :limit => 40
      t.string :salted_password, :limit => 40, :null => false
      t.string :salt, :limit => 40, :null => false
      t.timestamps
    end
     add_index :users, [:name], :name => :users_name_index, :unique => true

  end

  def self.down
    remove_index :users, :name => :users_name_index
    drop_table :users
  end
end
