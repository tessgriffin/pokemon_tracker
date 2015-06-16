class PokemonController < ApplicationController
  def index
    @pokemon = current_user.pokemon
  end

  def new
    @pokemon = Pokemon.new
    @species = ApiSpecies.all
    @parsed_array = ParserService.parse(@species.pokemon)
    @natures = Nature.all
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user_id = current_user.id
    @pokemon.species_id = Species.find_by(national_id: params[:pokemon][:species_id]).id
    params[:pokemon][:stats].each do |name, value|
      @pokemon.stats[name] = value.to_i
    end
    if @pokemon.save
      flash[:success] = "#{@pokemon.nickname} created"
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
      flash[:success] = "#{@pokemon.nickname} updated"
      redirect_to @pokemon
    else
      flash[:errors] = @pokemon.errors.full_messages.join(", ")
      render show
    end 
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    pokemon_name = @pokemon.nickname
    @pokemon.destroy
    flash[:danger] = "#{pokemon_name} deleted"
    redirect_to pokemon_index_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(
      :nickname,
      :nature_id,
      :level,
      :species_id,
      stats: [:hp, :attack, :special_attack, :special_defense, :speed],
      evs: [:hp, :attack, :special_attack, :defense, :special_defense, :speed]
    )
  end
end