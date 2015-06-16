class ParserService

  def self.parse(array)
    array.map do |pokemon|
      inner_array = []
      id = pokemon[:resource_uri].split("/")[-1]
      inner_array << pokemon[:name]
      inner_array << id
    end.sort
  end
end