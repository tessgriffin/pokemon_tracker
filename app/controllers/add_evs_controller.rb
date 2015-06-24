class AddEvsController < ApplicationController
  respond_to :json

  def create
    stat = params["pokemon"]["ev"]
    amount = params["pokemon"]["value"].to_i
    pokemon.evs[stat] += amount
    pokemon.save!
    respond_with pokemon, location: ""
  end

  private

  def pokemon
    @pokemon ||= Pokemon.find(params[:pokemon_id])
  end
end