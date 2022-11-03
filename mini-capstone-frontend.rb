require "http"

response = HTTP.get("http://localhost:3000/products")
products = response.parse(:json)
pp products

response = HTTP.get("http://localhost:3000/products/1")
product = response.parse(:json)
pp product
