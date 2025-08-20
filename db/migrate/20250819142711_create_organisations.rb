class CreateOrganisations < ActiveRecord::Migration[8.0]
  def change
    create_table :organisations do |t|
      t.text :name, null: false
      t.text :slug, null: false
      t.text :url
      t.text :govuk_status, null: false, default: "live"
      t.datetime :closed_at
      t.text :content_id
      t.boolean :political, null: false, default: false
      t.text :organisation_type_key, null: false
      t.text :govuk_closed_status

      t.timestamps
    end
    add_index :organisations, :slug
    add_index :organisations, :organisation_type_key
    add_index :organisations, :content_id
  end
end
