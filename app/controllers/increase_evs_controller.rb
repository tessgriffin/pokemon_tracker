class IncreaseEvsController < ApplicationController
  def create
    pokemon = Pokemon.find(params[:pokemon_id])
    ev = EffortValue.find(params[:pokemon][:evs].to_i)
    pokemon.evs[ev.stat] += ev.amount * params[:amount].to_i
    pokemon.save!
    flash[:success] = "Added Ev"
    redirect_to pokemon
  end
end