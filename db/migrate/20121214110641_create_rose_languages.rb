class CreateRoseLanguages < ActiveRecord::Migration
  def change
    create_table :rose_languages do |t|
      t.string :token
      t.integer :translation_column
      t.string :translation_id
    end

    add_index :rose_languages, :token, :unique => true
    add_index :rose_languages, :translation_column, :unique => true
  end
end
