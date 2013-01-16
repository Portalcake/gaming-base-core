# This migration comes from forum (originally 20130116195121)
class ForumAddViewsToTopics < ActiveRecord::Migration
  def change
    add_column :forum_topics, :views_count, :integer, :default=>0, :null=>false
  end
end
