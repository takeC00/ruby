require "csv"
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.chomp.to_s

#puts memo_type #入力した文字を確認用

if memo_type === "1"
  puts "----メモ新規作成----"
  puts "ーーーーーーーーーーーーー拡張子を除いたファイル名を入力して下さいーーーーーーーーーーーーー"
  memo_title = gets.chomp.to_s
  
  puts "ーーーーーーーーーーーーーメモ内容を入力してくださいーーーーーーーーーーーーー"
  memo_text = gets.chomp.to_s
  CSV.open("#{memo_title}.csv",'w') do |csv|
    csv << [memo_text]
  end
  
elsif memo_type === "2"
  puts "----メモ編集----"
  Dir.foreach('.') do |item|
    next if item == '.' or item == '..'
    puts item
  end
  puts "ーーーーーーーーーーーーー上記のcsvファイルから、編集したいファイル名を拡張子を除いて入力してくださいーーーーーーーーーーーーー"
  memo_title = gets.chomp.to_s
  
  CSV.open("#{memo_title}.csv",'a') do |csv|
    puts "ーーーーーーーーーーーーー#{memo_title}.csvに追記しますーーーーーーーーーーーーー"
    memo_add = gets.chomp.to_s  
    csv << [memo_add]
  end
 

else 
  puts "エラー！！正しい番号を入力してください"
end

