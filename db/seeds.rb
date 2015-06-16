@species = ApiSpecies.all
@species.pokemon.each do |pokemon|
  Species.create(name: pokemon[:name], national_id: pokemon[:resource_uri].split("/")[-1])
  puts "#{pokemon[:name]} created"
end

natures = [["adamant", "attack", "special_attack"], ["bashful", nil, nil],
           ["bold", "defense", "attack"], ["brave", "attack", "speed"],
           ["calm", "special_defense", "attack"], ["careful", "special_defense", "special_attack"],
           ["docile", nil, nil], ["gentle", "special_defense", "defense"],
           ["hardy", nil, nil], ["hasty", "speed", "defense"],
           ["impish", "defense", "special_attack"], ["jolly", "speed", "special_attack"],
           ["lax", "defense", "special_defense"], ["lonely", "attack", "defense"],
           ["mild", "special_attack", "defense"], ["modest", "special_attack", "attack"],
           ["naive", "speed", "special_defense"], ["naughty", "attack", "special_defense"],
           ["quiet", "special_attack", "speed"], ["quirky", nil, nil],
           ["rash", "special_attack", "special_defense"], ["relaxed", "defense", "speed"],
           ["sassy", "special_defense", "speed"], ["serious", nil, nil], ["timid", "speed", "attack"]]

natures.each do |nature|
  Nature.create(name: nature[0], increase: nature[1], decrease: nature[2])
  puts "#{nature[0]} created"
end