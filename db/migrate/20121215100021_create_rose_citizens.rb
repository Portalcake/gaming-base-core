class CreateRoseCitizens < ActiveRecord::Migration
  def change
    create_table :rose_citizens do |t|

      t.string :name, :default => "", :null => false
      t.string :npc_filename
      t.integer :walking_speed
      t.integer :running_speed
      t.integer :npc_size
      t.integer :weapon_id_right
      t.integer :weapon_id_left
      t.integer :level
      t.integer :hp
      t.integer :atk
      t.integer :accuracy
      t.integer :defense
      t.integer :magical_defense
      t.integer :flee
      t.integer :atk_speed
      t.integer :magic
      t.integer :ai_type
      t.integer :exp
      t.integer :drop_items
      t.integer :money
      t.integer :drop_item
      t.integer :trade_tab1
      t.integer :trade_tab2
      t.integer :trade_tab3
      t.integer :trade_tab4
      t.integer :target_type
      t.integer :atk_range
      t.integer :character_type
      t.integer :texture_type
      t.integer :icon_number, :default => 0, :null => false
      t.integer :general_sound_effect
      t.integer :attacking_sound_effect
      t.integer :attacked_sound_effect
      t.integer :atk_effect
      t.integer :dying_effect
      t.integer :dying_sound_effect
      t.integer :death_event_targets
      t.integer :glow_effect
      t.string :npc_description
      t.string :death_event_triggers
      t.integer :hp_gauge_bar
      t.integer :model_attribute
      t.integer :singleton_npc
      t.integer :skill_distance
      t.integer :team_number
      t.integer :taunt_immunity
      t.integer :force_death_animation
      t.integer :hide_nameplate
      t.integer :decloak_chance_percent
      t.integer :interactive_object_type
      t.integer :interact_event_target
      t.string :interact_event_trigger
      t.string :interact_condition_trigger
      t.integer :self_skill_number
      t.integer :visibility
      t.integer :hp_gauge_visibility
      t.integer :crash
      t.integer :crash_index
      t.integer :crash_box_x
      t.integer :crash_box_y
      t.integer :crash_box_z

      t.timestamps
    end
  end
end
