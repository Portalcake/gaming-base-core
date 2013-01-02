# This migration comes from rose (originally 20121213095738)
class CreateRoseItemsGems < ActiveRecord::Migration
  def change
    create_table :rose_items_gems do |t|

      t.string :name, :default => "", :null => false
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
      t.integer :additional_ability_1_id
      t.integer :additional_ability_1_value
      t.integer :additional_ability_2_id
      t.integer :additional_ability_2_value
      t.integer :socket_graphic
      t.integer :glow_effect
      t.integer :option_percent_1
      t.integer :option_percent_2
      t.integer :decomposition_numbers
      t.string :item_description

      t.timestamps
    end
  end
end
