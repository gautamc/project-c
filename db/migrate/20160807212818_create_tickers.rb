class CreateTickers < ActiveRecord::Migration[5.0]
  def change
    create_table :tickers do |t|
      t.text :symbol
      t.timestamps
    end

    create_table :users_tickers, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :ticker, index: true
    end
  end
end
