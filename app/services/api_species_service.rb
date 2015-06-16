class ApiSpeciesService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('http://pokeapi.co/api/v1')
  end

  def pokedex
    parse(connection.get('pokedex/1').body)
  end

  def species(id)
    parse(connection.get("pokemon/#{id}").body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end