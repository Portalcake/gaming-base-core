class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :title
      t.string :feed_url, :default=>"", :null=>false
      t.references :game
      t.datetime :last_accessed
      t.string :last_error
    end

    add_index :news_feeds, :game_id
  end
end
