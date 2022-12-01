class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/movies" do
    movies = Movie.all
    movies.to_json
  end

  # Returns a movie's reviews and relevant users

  get "/movies/:id/reviews" do 
    movie = Movie.find(params[:id])
    return_hash = movie.get_reviews_with_user_and_average_rating
    return_hash.to_json
  end

end
