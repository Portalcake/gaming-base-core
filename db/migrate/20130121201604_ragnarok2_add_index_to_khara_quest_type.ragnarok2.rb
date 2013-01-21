# This migration comes from ragnarok2 (originally 20130121191907)
class Ragnarok2AddIndexToKharaQuestType < ActiveRecord::Migration
  def change
    add_index :ragnarok2_kharas, :quest_type
  end
end
