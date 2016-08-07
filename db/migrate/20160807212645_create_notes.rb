class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :ticker_id

      t.timestamps
    end
  end
end
