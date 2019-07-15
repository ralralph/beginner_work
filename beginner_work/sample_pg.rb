require 'pg'

connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  result_false = connection.exec("select * from crops where quality = false;")
  result_false.each do |record|
    puts "ゴーヤのクオリティ：#{record["quality"]}　売った相手：#{record["give_for"]} 収穫日：#{record["date"]} "
  end

  result = connection.exec("select * from crops where not (give_for = '自家消費');")
  result.each do |record|
    puts "売った相手：#{record["give_for"]}　ゴーヤの長さ：#{record["length"]} ゴーヤの重さ：#{record["weitht"]}"
  end
ensure
  connection.finish
end
