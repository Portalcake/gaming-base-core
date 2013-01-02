# This migration comes from rose (originally 20121213102328)
class CreateRoseItemsEquipmentMasks < ActiveRecord::Migration
  def change
    create_table :rose_items_equipment_masks do |t|

      t.string :name, :default => "", :null => false
      t.string :male_model
      t.string :female_model
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
      t.integer :required_job_1_id
      t.integer :required_job_2_id
      t.integer :required_job_3_id
      t.integer :required_ability_1_id
      t.integer :required_ability_1_value
      t.integer :required_ability_2_id
      t.integer :required_ability_2_value
      t.integer :requirement_union1
      t.integer :additional_increase_stat1
      t.integer :additional_increase_value1
      t.integer :requirement_union2
      t.integer :additional_increase_stat2
      t.integer :additional_increase_value2
      t.integer :durability
      t.integer :dodge
      t.integer :defense
      t.integer :magical_defense
      t.integer :texture
      t.integer :product
      t.integer :refine
      t.integer :break
      t.integer :pvp_atk
      t.integer :pvp_def
      t.integer :pvm_atk
      t.integer :pvm_def
      t.string :model_attribute
      t.integer :rare_type
      t.integer :item_set_id
      t.integer :name_prefix_id
      t.string :item_description

      t.timestamps
    end
  end
end
