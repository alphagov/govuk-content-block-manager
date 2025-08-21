class CreateContentBlockEditionAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :content_block_edition_authors do |t|
      t.integer :user_id, null: false
      t.integer :edition_id, null: false

      t.timestamps
    end
    add_index :content_block_edition_authors, :user_id
    add_index :content_block_edition_authors, :edition_id
  end
end
