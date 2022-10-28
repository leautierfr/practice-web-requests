require "http"

system "clear"

word = word

until word == "q"
  puts "Welcome to the dictionary app"
  puts "Enter a word, or press q to quit :"

  word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=APIKEY")

  word_data = response.parse(:json)
  pp word_data[0]["text"]

  example = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=APIKEY")

  example_data = example.parse(:json)
  pp example_data["examples"][0]["text"]

  pronounciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=APIKEY")

  pronounciation_data = pronounciation.parse(:json)
  pp pronounciation_data[0]["raw"]
end
