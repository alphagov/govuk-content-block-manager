class CreateContentBlockEditions < ActiveRecord::Migration[8.0]
  def change
    create_table :content_block_editions do |t|
      t.json :details, null: false
      t.integer :document_id, null: false
      t.text :state, null: false, default: "draft"
      t.datetime :scheduled_publication
      t.text :instructions_to_publishers
      t.text :title, null: false, default: ""
      t.text :internal_change_note
      t.text :change_note
      t.boolean :major_change

      t.timestamps
    end

    add_index :content_block_editions, :title
    add_index :content_block_editions, :document_id
  end
end
