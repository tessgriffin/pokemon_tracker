class SpeciesController < ApplicationController
  def index
    @species = Species.find(500)
  end
end