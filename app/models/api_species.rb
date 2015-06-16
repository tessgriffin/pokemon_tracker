class ApiSpecies < OpenStruct
  def self.service
    @service ||= ApiSpeciesService.new
  end

  def self.all
    new(service.pokedex)
  end

  def self.find(id)
    new(service.species(id))
  end
end