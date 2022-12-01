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
    reviews = movie.reviews
    users = movie.users

    # Work out the Average rating of all reviews
    average_rating = reviews.sum(:rating) / reviews.count.to_f

    # Make an array of hashes of each movie's review with its user
    reviews_with_user = reviews.map do |review|
      index = reviews.index(review)
      user = users[index]
      return_hash = {
        review: review,
        user: user
      }
    end

    # Add the average rating

    reviews_with_user_and_average_rating = { return_hash: reviews_with_user, average_rating: average_rating}

    reviews_with_user_and_average_rating.to_json
  end

end
