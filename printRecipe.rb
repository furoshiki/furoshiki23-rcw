# レシピ単体の情報を保持
class Recipe
  attr_accessor :id, :name
  def initialize( id, name )
    @id = id
    @name = name
  end
end

# レシピ情報へのアクセサー
class RecipeAccessor
  # レシピ情報を読み込む
  #  file_path : 情報が置かれているファイルがあれば、指定可能
  def initialize(file_path=nil)
    @current_id = 1
    @recipeList = []
    # ファイルがある場合は、そこから情報を取得する
    exit unless file_path
    begin
      File.open file_path do |recipe_data|
        recipe_data.each_line do |recipe_name|
          recipe_name = recipe_name.chomp
          add_recipe(recipe_name)
        end
      end
    rescue
      # ファイルが読み込めない場合は、何もしない
    end
  end
  # レシピを追加する
  def add_recipe(name)
    recipe = Recipe.new(@current_id,name)
    @recipeList.push(recipe)
    @current_id += 1
  end
  # 全レシピ情報のイテレーター
  def each_all
    @recipeList.each do |recipe|
      yield recipe
    end
  end
end

# レシピの読み込みと全データの標準出力
recipes = RecipeAccessor.new(ARGV[0])
recipes.each_all do |recipe|
  print "#{recipe.id} : #{recipe.name}\n"
end
