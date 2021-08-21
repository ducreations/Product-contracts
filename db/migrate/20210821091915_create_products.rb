class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :status, default: false
      t.bigint :price

      t.timestamps
    end
  end
end
