class LevelsController < ApplicationController
  def create
    pokemon = Pokemon.find(params[:pokemon_id])
    pokemon.level += 1
    params[:pokemon][:stats].each do |name, value|
      pokemon.stats[name] += value.to_i
    end
    pokemon.save!
    redirect_to pokemon
  end
end