class CreateRoseTranslationsItemTypes < ActiveRecord::Migration
  def change
    create_table :rose_translations_item_types do |t|

      t.integer :translation_id
      t.integer :language_id
      t.string :translation

      t.timestamps
    end

    add_index :rose_translations_item_types, [:language_id, :translation_id], :unique => true, :name => :tlid
  end
end
