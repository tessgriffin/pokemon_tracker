stats = ["hp", "attack", "defense", "special_attack", "special_defense", "speed"]
amounts = [1, 2, 3, 4]
stats.each do |stat|
  amounts.each do |amount|
    EffortValue.create(stat: stat, amount: amount)
    puts "#{stat} +#{amount} created"
  end
end

@species = ApiSpecies.all
@species.pokemon.each do |pokemon|
  Species.create(name: pokemon[:name], national_id: pokemon[:resource_uri].split("/")[-1])
  puts "#{pokemon[:name]} created"
end

species_ev = ["gulpin", "whismur",
              "shuppet", "bellsprout", "cubchoo",
              "weepinbell",
              "sandshrew", "nosepass", "geodude",
              "durant",
              "oddish", "spinda", "vanillite",
              "swablu", "hoppip",
              "zigzagoon","wingull", "zubat", "taillow"]

species_ev[0..1].each do |name|
  species = Species.find_by(name: name)
  species.update_attributes(effort_value_id: EffortValue.find_by(stat: "hp", amount: 1).id)
end

species_ev[2..4].each do |name|
  species = Species.find_by(name: name)
  species.update_attributes(effort_value_id: EffortValue.find_by(stat: "attack", amount: 1).id)
end

species = Species.find_by(name: species_ev[5])
species.update_attributes(effort_value_id: EffortValue.find_by(stat: "attack", amount: 2).id)

species_ev[6..8].each do |name|
  species = Species.find_by(name: name)
  species.update_attributes(effort_value_id: EffortValue.find_by(stat: "defense", amount: 1).id)
end

species = Species.find_by(name: species_ev[9])
species.update_attributes(effort_value_id: EffortValue.find_by(stat: "defense", amount: 2).id)


species_ev[10..12].each do |name|
  species = Species.find_by(name: name)
  species.update_attributes(effort_value_id: EffortValue.find_by(stat: "special_attack", amount: 1).id)
end

species_ev[13..14].each do |name|
  species = Species.find_by(name: name)
  species.update_attributes(effort_value_id: EffortValue.find_by(stat: "special_defense", amount: 1).id)
end

species_ev[15..18].each do |name|
  species = Species.find_by(name: name)
  species.update_attributes(effort_value_id: EffortValue.find_by(stat: "speed", amount: 1).id)
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