class CreateRoseTranslationsDescriptions < ActiveRecord::Migration
  def change
    create_table :rose_translations_descriptions do |t|

      t.string :translation_id
      t.integer :language_id
      t.string :translation

      t.timestamps
    end

    add_index :rose_translations_descriptions, [:language_id, :translation_id], :unique => true, :name => :tlid
  end
end
