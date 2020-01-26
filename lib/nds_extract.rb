# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection) #[{:title=>"TestA"}, {:title=>"TestB"}]
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  result = []
  i = 0
  while i < movies_collection.length do
    movie_data = movies_collection[i] #created this variable because we wanted to use each index from movies_collection
                                # and add it into our result array. Because we know movie_with_director_name works with
                                # hashes we threw that method in with the new variable so that it can take the hashes
                                # from movies_collection and extract them individually by the index into result
    result << movie_with_director_name(name, movie_data)
    i += 1
  end
  result
   #created this variable because we wanted to use each index from movies_collection
                                # and add it into our result array. Because we know movie_with_director_name works with
                                # hashes we threw that method in with the new variable so that it can take the hashes
                                # from movies_collection and extract them individually by the index into result

  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #[{director_name_key: movie}]
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
end


def gross_per_studio(collection) #we want to find out how much each studio is grossing
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
#collection =
  #[{:title=>"Movie A", :studio=>"Alpha Films", :worldwide_gross=>10},
 #{:title=>"Movie B", :studio=>"Alpha Films", :worldwide_gross=>30},
 #{:title=>"Movie C", :studio=>"Omega Films", :worldwide_gross=>30}]
result = {}
i = 0
while i < collection.length do
  movie = collection[i]
  studio_name = collection[i][:studio]
  movie_gross = movie[:worldwide_gross]

  if !result[studio_name]
    result[studio_name] = movie_gross
  else
    result[studio_name] += movie_gross


end

  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
end

def movies_with_directors_set(source)
  #[{:name=>"Byron Poodle",:movies=>[{:title=>"At the park"}, {:title=>"On the couch"}]},
  #{:name=>"Nancy Drew", :movies=>[{:title=>"Biting"}]}]
  # GOAL: For each director, find their :movies Array and stick it in a new Array

  outer = []
  outer_index = 0
  while outer_index < source.length do
    movies_index = 0
    director_name = source[outer_index][:name]
    director_movies = source[outer_index][:movies]
    outer << movies_with_director_key(director_name,director_movies)
    outer_index += 1
  end
  outer
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies

  # RETURN:
  #
  # Array of Hashes containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
