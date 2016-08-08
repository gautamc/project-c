require 'csv'

namespace :import do

  desc "Import FailedToDeliver data"
  task :import_ftd, [:input_file] => :environment do |task, args|

    begin

      input_file = CSV.open(
        File.new(args[:input_file]),
        { headers: true, col_sep: '|', quote_char: ";" }
      )
      input_file.each_with_index do |input_row, ix|

        row = input_row.to_hash

        ticker = Ticker.find_or_create_by(
          symbol:      row['SYMBOL'],
          description: row['DESCRIPTION']
        )

        FailedToDeliver.create(
          settlement_date: Date.strptime(row['SETTLEMENT DATE'], "%Y%m%d"),
          cusip:           row['CUSIP'],
          symbol:          row['SYMBOL'],
          fail_quantity:   row['QUANTITY (FAILS)'],
          description:     row['DESCRIPTION'],
          price:           row['PRICE'] == "." ? nil : row['PRICE'].to_f
        )

      end

    rescue => e
      error ||= {}
      error[:inspect] = e.inspect
      error[:backtrace] = e.backtrace
    ensure
      unless error
        puts "%s - FailedToDeliver file was imported successfully" % args[:input_file]
      else
        puts "%s - FailedToDeliver file was not be imported" % args[:input_file]
        puts error[:inspect]
        puts error[:backtrace]
      end
    end

  end
end
