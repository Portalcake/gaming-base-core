class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, :default => "", :null => false
      t.string :token, :default => "", :null => false
      t.boolean :maintenance, :default => false, :null => false
      t.boolean :published, :default => false, :null => false
      t.timestamps
    end

    add_index :games, :token, :unique => true
  end
end
