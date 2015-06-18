class AddEvsController < ApplicationController
  respond_to :json

  def create
    pokemon = Pokemon.find(params["post"]["pokemonId"].to_i)
    stat = params["post"]["pokemon"]["ev"]
    amount = params["post"]["pokemon"]["value"].to_i
    new_amount = pokemon.evs[stat] += amount
    pokemon.save!
    respond_with pokemon
  end
end