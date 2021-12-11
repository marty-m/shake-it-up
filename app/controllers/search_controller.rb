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
end
