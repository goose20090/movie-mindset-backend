class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/movies" do
    movies = Movie.all
    movies.to_json
  end

  # Returns a movie's review and relevant user
  
  get "/movies/:id/reviews" do 
    movie = Movie.find(params[:id])
    reviews = movie.reviews
    users = reviews.map{|review| review.user}
    reviews_with_user = reviews.map do |review|
      index = reviews.index(review)
      user = users[index]
      return_hash = {
        review: review,
        user: user
      }
    end
    reviews_with_user.to_json
  end

end
