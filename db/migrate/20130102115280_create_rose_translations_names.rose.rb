# This migration comes from rose (originally 20121221112944)
class CreateRoseTranslationsNames < ActiveRecord::Migration
  def change
    create_table :rose_translations_names do |t|

      t.string :translation_id
      t.integer :language_id
      t.string :translation

      t.timestamps
    end

    add_index :rose_translations_names, [:language_id, :translation_id], :unique => true, :name => :tlid
  end
end
