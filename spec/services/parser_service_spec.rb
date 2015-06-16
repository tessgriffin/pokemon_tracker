RSpec.describe "parser service" do 
  it "parses the pokemon" do 
    array = [{:name=>"rattata", :resource_uri=>"api/v1/pokemon/19/"},
             {:name=>"zweilous", :resource_uri=>"api/v1/pokemon/634/"}]
    parsed_array = ParserService.parse(array)

    expect(parsed_array).to eq([["rattata", "19"], ["zweilous", "634"]])
  end

  it "parses the pokemon alphabetically" do 
    array = [{:name=>"charmander", :resource_uri=>"api/v1/pokemon/4/"},
             {:name=>"zweilous", :resource_uri=>"api/v1/pokemon/634/"},
             {:name=>"rattata", :resource_uri=>"api/v1/pokemon/19/"}]
    parsed_array = ParserService.parse(array)

    expect(parsed_array).to eq([["charmander", "4"], ["rattata", "19"], ["zweilous", "634"]])
  end
end