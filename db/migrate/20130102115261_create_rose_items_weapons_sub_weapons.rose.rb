# This migration comes from rose (originally 20121213085308)
class CreateRoseItemsWeaponsSubWeapons < ActiveRecord::Migration
  def change
    create_table :rose_items_weapons_sub_weapons do |t|

      t.string :name, :default => "", :null => false
      t.string :model_filename
      t.integer :restriction
      t.integer :item_type_id
      t.integer :price
      t.integer :price_fluctuation_rate
      t.integer :weight
      t.integer :quality
      t.integer :icon_number
      t.integer :field_item
      t.integer :equipping_sound_effect
      t.integer :crafting_id
      t.integer :crafting_level
      t.integer :crafting_material_id
      t.integer :crafting_difficulty
      t.integer :required_job_1_id
      t.integer :required_job_2_id
      t.integer :required_job_3_id
      t.integer :required_ability_1_id
      t.integer :required_ability_1_value
      t.integer :required_ability_2_id
      t.integer :required_ability_2_value
      t.integer :conditional_affiliations1
      t.integer :additional_ability_1_id
      t.integer :additional_ability_1_value
      t.integer :conditional_affiliations2
      t.integer :additional_ability_2_id
      t.integer :additional_ability_2_value
      t.integer :durability
      t.integer :accuracy
      t.integer :defense
      t.integer :magical_defense
      t.integer :material_type
      t.integer :name_prefix_id
      t.integer :product
      t.integer :refine
      t.integer :break
      t.integer :pvp_atk
      t.integer :pvp_def
      t.integer :pvm_atk
      t.integer :pvp_def
      t.string :model_attribute
      t.integer :item_set_id
      t.integer :name_prefix_id
      t.string :item_description

      t.timestamps
    end
  end
end
