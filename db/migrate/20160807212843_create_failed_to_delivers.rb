class CreateFailedToDelivers < ActiveRecord::Migration[5.0]
  def change
    create_table :failed_to_delivers do |t|
      t.date :settlement_date 
      t.string :cusip
      t.string :symbol
      t.integer :fail_quantity
      t.string :description
      t.float :price
      t.timestamps
    end
  end
end
