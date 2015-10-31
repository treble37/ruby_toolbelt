require 'csv'

class CSVTools
  def hash_to_csv_file(h, file_name="test.csv", options={columns: 1, headers: [], write_headers: false})
    #hash keys are 1 column, hash values are 1 column; if array of multiple hash values, you can specify whether you want them to be spread across multiple columns
    CSV.open(file_name, "w+", write_headers: options[:write_headers], headers: options[:headers]) do |csv|
      h.each do |key, value|
        row = key.to_s
        v = value.is_a?(Array) ? value.join(",") : value.to_s
        row = [row, v]
        csv << row
      end
    end
  end

  def read_from_csv_file(file_name)
    @csv_data = []
    CSV.foreach(file_name) do |row|
      @csv_data << row
    end
    @csv_data
  end
end

