class CreateContentBlockDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :content_block_documents do |t|
      t.text :content_id
      t.text :sluggable_string
      t.text :block_type
      t.integer :latest_edition_id
      t.integer :live_edition_id
      t.string :content_id_alias
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :content_block_documents, :latest_edition_id
    add_index :content_block_documents, :live_edition_id
    add_index :content_block_documents, :content_id_alias, unique: true
  end
end
