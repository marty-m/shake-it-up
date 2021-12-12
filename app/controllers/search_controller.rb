class SearchController < ApplicationController

  def new
    @search = Search.new
  end

  def searchResults

    @searchText = params[:searchInput]
    @nameArr = []
    @urlArr =[]
    @IdArr = []
    @hash1 = {}
    @response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{@searchText}")
    @jdoc1 = JSON.parse(@response.body)
    if @jdoc1["drinks"] == nil
      redirect_to root_path(error: 404)
    else
      @jdoc1["drinks"].each  do |sub|
        @nameArr.push(sub["strDrink"])
      end
      @jdoc1["drinks"].each  do |sub|
        @urlArr.push("#{sub["strDrinkThumb"]}/preview")
      end
      @jdoc1["drinks"].each  do |sub|
        @IdArr.push(sub["idDrink"])
        puts @IdArr
      end
      for n in (0..@nameArr.size-1) do
        @hash1[@nameArr[n]] = @urlArr[n]
      end
    end

  end

  def cocktailPage
    @hash2 = {}
    @response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{params[:id]}")
    @jdoc3 = JSON.parse(@response.body)

    @jdoc3["drinks"].each  do |sub|
    @name2 =  sub["strDrink"]
    @photoUrl2 = "#{sub["strDrinkThumb"]}/preview"

    if sub["strCategory"] != nil then @category2 = sub["strCategory"] end

    @alco2 = sub["strAlcoholic"]
    @glass2 = sub["strGlass"]
    @inst2 = sub["strInstructions"]
    @photoUrl2 = "#{sub["strDrinkThumb"]}/preview"

    for i in (1..15) do
      if (sub["strIngredient#{i}"] != nil) && (sub["strIngredient#{i}"] != " ") && (sub["strIngredient#{i}"] != "")
        @hash2[sub["strIngredient#{i}"]] = sub["strMeasure#{i}"]
      end
    end

    end
  end

  def randomPage
    @hash = {}
    @responseRand = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/random.php")
    @jdoc = JSON.parse(@responseRand.body)
    @jdoc["drinks"].each  do |sub|
      @name =  sub["strDrink"]
      if sub["strCategory"] != nil then @category = sub["strCategory"] end
      @alco = sub["strAlcoholic"]
      @glass = sub["strGlass"]
      @inst = sub["strInstructions"]
      @photoUrl = "#{sub["strDrinkThumb"]}/preview"
      for i in (1..15) do
        if (sub["strIngredient#{i}"] != nil) && (sub["strIngredient#{i}"] != " ") && (sub["strIngredient#{i}"] != "")
          @hash[sub["strIngredient#{i}"]] = sub["strMeasure#{i}"]
          puts @hash
        end
      end
    end
  end
end
