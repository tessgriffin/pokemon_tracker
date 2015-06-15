class Species < OpenStruct
  def self.service
    @service ||= SpeciesService.new
  end

  def self.find(id)
    new(service.species(id))
  end
end