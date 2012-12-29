class CreateRoseItemsEngineParts < ActiveRecord::Migration
  def change
    create_table :rose_items_engine_parts do |t|

      t.string :name, :default => "", :null => false
      t.string :model_filename
      t.integer :item_slot
      t.integer :item_restriction
      t.integer :item_type_id
      t.integer :price
      t.integer :price_fluctuation_rate
      t.integer :weight
      t.integer :quality
      t.integer :icon_number
      t.integer :field_number
      t.integer :sound_fx
      t.integer :crafting_number
      t.integer :crafting_level
      t.integer :crafting_material
      t.integer :crafting_difficulty
      t.integer :part_type
      t.integer :part_version
      t.integer :avatar_board
      t.integer :required_skill
      t.integer :required_skill_level
      t.integer :required_ability_1_id
      t.integer :required_ability_1_value
      t.integer :additional_ability_1_id
      t.integer :additional_ability_1_value
      t.integer :additional_ability_2_id
      t.integer :additional_ability_2_value
      t.integer :durability
      t.integer :slope
      t.integer :maximum_fuel
      t.integer :fuel_consumption
      t.integer :movement_speed
      t.integer :terrain
      t.integer :atk_range
      t.integer :atk
      t.integer :atk_speed
      t.integer :redundancy
      t.integer :seating_capacity
      t.integer :behavior_type
      t.integer :avatar_action_type
      t.integer :model_effect
      t.integer :sound_effect
      t.integer :dying_effect
      t.integer :dying_sound_effect
      t.integer :destruction_effect
      t.integer :destruction_sound_effect
      t.integer :idle_sfx
      t.integer :movement_effect
      t.integer :movment_sfx
      t.integer :primary_effect
      t.integer :attack_sfx
      t.integer :damage_effect
      t.integer :hit_sfx
      t.integer :bullet_effect
      t.integer :p1
      t.integer :p2
      t.integer :p3
      t.integer :p4
      t.integer :p5
      t.integer :p6
      t.integer :p7
      t.integer :p8
      t.integer :firing_point_1
      t.integer :firing_point_2
      t.integer :firing_point_3
      t.integer :cart_gauge
      t.integer :occupations
      t.integer :magic_damage
      t.integer :ability
      t.integer :break
      t.integer :pat_class
      t.integer :planet_restriction
      t.integer :damage_calculation_type
      t.string :item_description

      t.timestamps
    end
  end
end
