# This migration comes from ragnarok2 (originally 20130118101855)
class Ragnarok2AddCorrectionLevelAndEquipToMaps < ActiveRecord::Migration
  def change
    add_column :ragnarok2_maps, :correction_level, :integer
    add_column :ragnarok2_maps, :correction_equip, :integer
  end
end
