class PokemonController < ApplicationController
  def index
    @pokemon = current_user.pokemon
  end

  def new
    @pokemon = Pokemon.new
    @species = Species.all
    @natures = Nature.all
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user_id = current_user.id
    if params[:a_to_h].present?
      @pokemon.species_id = params[:a_to_h].to_i
    elsif params[:i_to_r].present?
      @pokemon.species_id = params[:i_to_r].to_i
    elsif params[:s_to_z].present?
      @pokemon.species_id = params[:s_to_z].to_i
    end
    params[:pokemon][:stats].each do |name, value|
      @pokemon.stats[name] = value.to_i
    end
    if @pokemon.save
      flash[:success] = "#{@pokemon.nickname} created"
      redirect_to pokemon_index_path
    else
      flash.now[:error] = @pokemon.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @species = Species.evs_given
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
    @pokemon.destroy!
    flash[:danger] = "#{@pokemon.nickname} deleted"
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