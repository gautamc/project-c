class Ticker < ApplicationRecord
  has_and_belongs_to_many :tickers
end
