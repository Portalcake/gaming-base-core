# This migration comes from ragnarok2 (originally 20130101144028)
class Ragnarok2MergeClientUpdate20130101 < ActiveRecord::Migration
  def up
    add_column :ragnarok2_items, :weapon_type, :integer
  end

  def down
    remove_column :ragnarok2_items, :weapon_type, :integer
  end
end
