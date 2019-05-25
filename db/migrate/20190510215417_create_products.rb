class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :type
      t.text :name
      t.decimal :price
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
