class ApiSpeciesController < ApplicationController
  def index
    @api_species = ApiSpecies.all
    @parsed_array = ParserService.parse(@api_species.pokemon)
  end
end