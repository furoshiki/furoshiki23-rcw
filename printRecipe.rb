# 引数の存在確認
recipe_file_path = ARGV[0]
exit unless recipe_file_path

# レシピファイルから結果のフードを取得し標準出力
begin
  File.open recipe_file_path do |recipe_data|
    recipe_data.each_line do |item|
      print item
    end
  end
rescue
  # ファイルが読み込めない場合は、何も出力しない
  exit
end
