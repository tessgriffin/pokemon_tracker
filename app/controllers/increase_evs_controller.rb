class IncreaseEvsController < ApplicationController
  respond_to :json

  def create
    pokemon = Pokemon.find(params[:pokemon_id])
    ev = EffortValue.find(params[:pokemon][:evs])
    pokemon.evs[ev.stat] += ev.amount * params[:pokemon][:amount].to_i
    pokemon.save!
    response = {pokemon: pokemon, stat: ev.stat}
    respond_with response, location: ""
  end
end