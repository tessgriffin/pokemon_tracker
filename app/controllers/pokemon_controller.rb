class PokemonController < ApplicationController
  def index
    @pokemon = current_user.pokemon
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user_id = current_user.id
    if @pokemon.save
      redirect_to pokemon_index_path
    else
      flash[:error] = @pokemon.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update(pokemon_params)
      redirect_to @pokemon
    else
      flash[:errors] = @pokemon.errors.full_messages.join(", ")
      render show
    end 
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(
      :species,
      :nickname,
      :nature,
      :level,
      stats: [:hp, :attack, :special_attack, :special_defense, :speed],
      evs: [:hp, :attack, :special_attack, :defense, :special_defense, :speed]
    )
  end
end