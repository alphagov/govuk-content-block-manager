class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :uid, null: false
      t.text :email, null: false
      t.boolean :disabled, default: false
      t.boolean :remotely_signed_out, default: false
      t.text :organisation_slug
      t.text :permissions

      t.timestamps
    end
    add_index :users, :uid
    add_index :users, :email
    add_index :users, :organisation_slug
  end
end
