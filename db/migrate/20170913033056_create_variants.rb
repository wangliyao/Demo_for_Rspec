class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :production_id
      t.decimal :price, precision: 8, scale: 2
      t.string :size

      t.timestamps null: false
    end
  end
end
