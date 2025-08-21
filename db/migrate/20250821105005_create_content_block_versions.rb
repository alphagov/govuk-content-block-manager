class CreateContentBlockVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :content_block_versions do |t|
      t.text :item_type, null: false
      t.integer :item_id, null: false
      t.integer :event, null: false
      t.text :whodunnit
      t.text :state
      t.json :field_diffs
      t.text :updated_embedded_object_type
      t.text :updated_embedded_object_title

      t.timestamps
    end
    add_index :content_block_versions, :item_type
    add_index :content_block_versions, :item_id
  end
end
