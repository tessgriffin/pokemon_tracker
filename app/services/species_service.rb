class SpeciesService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('http://pokeapi.co/api/v1')
  end

  def species(id)
    parse(connection.get("pokemon/#{id}").body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end