class SearchController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @searchText = params[:searchInput]
    puts " SEARCH TEXT : #{@searchText}"
    redirect_to search_searchResults_url
  end

  def scrap
    
  end

  def searchResults
    @namearr = []
    @response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:searchInput]}")
    @jdoc1 = JSON.parse(@response.body)
    puts @searchText
    @jdoc1["drinks"].each  do |sub|
      @namearr.append(sub["strDrink"])
      puts @namearr
    end
  end

  def cocktailPage


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

  def randomPage
    @hash = {}
    @responseRand = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/random.php")
    @jdoc = JSON.parse(@responseRand.body)
    @jdoc["drinks"].each  do |sub|
      @name =  sub["strDrink"]
      puts @name
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
