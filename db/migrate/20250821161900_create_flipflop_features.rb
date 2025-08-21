class CreateFlipflopFeatures < ActiveRecord::Migration[8.0]
  def change
    create_table :flipflop_features do |t|
      t.text :key, null: false
      t.boolean :enabled, null: false, default: false

      t.timestamps
    end
    add_index :flipflop_features, :key
  end
end
