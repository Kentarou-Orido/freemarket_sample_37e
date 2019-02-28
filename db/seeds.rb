require "csv"

CSV.foreach('db/category.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  Category.create(:name => row[0], :ancestry => row[1])
end
