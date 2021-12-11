class SearchController < ApplicationController
  def searchResults
    @response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{SEARCHVAR}")
    @jdoc = JSON.parse(@response.body)
    @jdoc["drinks"].each  do |sub|
      puts sub["strDrink"]
  end

  def cocktailPage

  end
  end
  end
