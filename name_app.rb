require "http"

while true
  system "clear"

  puts "type in a name and I will predict your age! "

  name = gets.chomp

  response = HTTP.get("https://api.agify.io?name=#{name}")
  prediction = response.parse(:json)
  pp prediction["age"]

  puts = "Enter q to quit"

  if name == "q"
    break
  end
end
