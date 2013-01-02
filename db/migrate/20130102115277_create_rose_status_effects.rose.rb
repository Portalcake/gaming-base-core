# This migration comes from rose (originally 20121216120836)
class CreateRoseStatusEffects < ActiveRecord::Migration
  def change
    create_table :rose_status_effects do |t|
      
      t.string :subname, :default => "", :null => false
      t.string :name, :default => "", :null => false
      t.integer :effect_type
      t.integer :stackable
      t.integer :buff_type
      t.integer :removable
      t.integer :status_line_1
      t.integer :status_value_1
      t.integer :status_line_2
      t.integer :status_value_2
      t.integer :icon_number
      t.integer :effect
      t.integer :sound_effect
      t.integer :control1
      t.integer :control2
      t.integer :control3
      t.integer :ending_effect
      t.integer :ending_sound_effect
      t.integer :buff_type_depending_on_status_line
      t.string :effect_description
      
      t.timestamps
    end
  end
end
