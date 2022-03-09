require "csv"
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.to_s

#puts memo_type #入力した文字を確認用

if memo_type === "1\n"
  puts "メモ新規作成"
  puts "拡張子を除いたファイル名を入力して下さい"
  memo_title = gets.to_s
  
  puts "メモ内容を内容を入力してください"
  memo_text = gets.to_s
  CSV.open("#{memo_title}.csv",'w') do |csv|
    csv << [memo_text]
  end
  
elsif memo_type === "2\n"
  puts "メモ編集"
  puts "編集したいファイル名を拡張子除いて入力してください"
  memo_title = gets.to_s
  p CSV.read("#{memo_title}.csv")
else 
  puts "エラー！！正しい番号を入力してください"
end

