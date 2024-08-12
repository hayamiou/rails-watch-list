Movie.destroy_all

require 'uri'
require 'net/http'

pages = (1..10).to_a
pages.each do |page|
  url = URI("https://api.themoviedb.org/3/account/21431100/favorite/tv?language=en-US&page=1&sort_by=created_at.asc&page=#{page}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request['accept'] = 'application/json'
  request['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNzI4ZTk2MjBlNGIwMzI2ZTc0NDc0MjZlOWZjNTEwNCIsIm5iZiI6MTcyMzQ2MTkzOS4wMjU1OTMsInN1YiI6IjY2YjUxNDdlYzg0OWYwNmVlY2U5Mzk4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0dIWptrkP1rHbe-f0vc1ea_9PezIbhZltdVKrECb724'

  response = http.request(request)

  movies = JSON.parse(response.read_body).dig("results")
  movies.each do |movie|
    m = Movie.new(title: movie['name'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['rating'])
    p m.save!
  end
end

p Movie.count
