# This migration comes from ragnarok2 (originally 20130501101224)
class Ragnarok2MergeNewFeatures20130501 < ActiveRecord::Migration
  def up
    add_column :ragnarok2_skills, :skill_duration, :float
    add_column :ragnarok2_skills, :skill_tick_cycle, :float
  end

  def down
    remove_column :ragnarok2_skills, :skill_duration
    remove_column :ragnarok2_skills, :skill_tick_cycle
  end
end
