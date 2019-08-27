require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  character_movies = []

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].find do |character|
    if character["name"].downcase == character_name
    character_movies = character["films"]
      return character_movies

    end
  end
  puts "This characters does not exist, please insert another name"


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

    # binding.pry
end

def print_movies(films_array)
  # some iteration magic and puts out the movies in a nice list

  films_array.each {|film| puts film}

end

def show_character_movies(character)
  films_array = []
  films = get_character_movies_from_api(character)
  # films is an array of url strings
  #should get each element from this array and print out the movie name


    films.map do |film|

     film_string = RestClient.get("#{film}")
     film_hash = JSON.parse(film_string)
     films_array << film_hash["title"] # gives us the title of the movie
     #binding.pry



   end

   #binding.pry

  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
