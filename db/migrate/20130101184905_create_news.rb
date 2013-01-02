class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|

      t.string :title, :default=>"", :null=>false
      t.string :url
      t.string :author
      t.references :user
      t.references :game
      t.text :content
      t.datetime :published, :null=>false

      t.timestamps
    end

    add_index :news, :published
    add_index :news, :user_id
    add_index :news, :game_id
  end
end
