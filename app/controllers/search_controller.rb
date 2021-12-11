class SearchController < ApplicationController
  def searchResults
    @response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{@searchText}")
    @jdoc = JSON.parse(@response.body)
    @jdoc["drinks"].each  do |sub|
      puts sub["strDrink"]
    end
  end

  def cocktailPage

  end

  def randomPage
    @hash = {}
    @response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/random.php")
    @jdoc = JSON.parse(@response.body)
    @jdoc["drinks"].each  do |sub|
      @name =  sub["strDrink"]
      puts @name
      if sub["strCategory"] != nil then @category = sub["strCategory"] end
      @alco = sub["strAlcoholic"]
      @glass = sub["strGlass"]
      @inst = sub["strInstructions"]
      @photoUrl = "#{sub["strDrinkThumb"]}/preview"
      for i in (1..15) do
        if (sub["strIngredient#{i}"] != nil) && (sub["strIngredient#{i}"] != " ")
          @hash[sub["strIngredient#{i}"]] = sub["strMeasure#{i}"]
          puts @hash
        end
      end
    end
  end
end
