class CreateContentBlockEditionOrganisations < ActiveRecord::Migration[8.0]
  def change
    create_table :content_block_edition_organisations do |t|
      t.integer :content_block_edition_id, null: false
      t.integer :organisation_id, null: false

      t.timestamps
    end
    add_index :content_block_edition_organisations, :content_block_edition_id
    add_index :content_block_edition_organisations, :organisation_id
  end
end
