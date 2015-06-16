@species = ApiSpecies.all
@species.pokemon.each do |pokemon|
  Species.create(name: pokemon[:name], national_id: pokemon[:resource_uri].split("/")[-1])
  puts "#{pokemon[:name]} created"
end

