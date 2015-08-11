# レシピファイルから結果のフードを取得し標準出力
File.open 'recipe-data.txt' do |recipe|
  recipe.each_line do |result|
    print result
  end
end
