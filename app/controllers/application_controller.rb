class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Returns a JSON response of all instances of the Movie class
  get "/movies" do
    movies = Movie.all
    movies.to_json(include:{reviews: {include: :user}})
  end

  # Returns a movie's reviews and relevant users, with that movie's average rating

  get "/users" do
    users = User.all
    users.to_json(include:{reviews: {include: :movie}})
  end

  post "/users" do
    user = User.create(
      name: params[:name],
      avatar: Faker::Avatar.image,
    )
    user.to_json(include:{reviews: {include: :movie}})
  end

  post "/reviews" do
    review = Review.create(
      comment: params[:comment],
      rating: params[:rating],
      movie_id: params[:movie_id],
      user_id: params[:user_id]
    )
    review.to_json(include: [:user, :movie])
  end
  # Updates a specific review's rating and comment
  patch "/reviews/:id" do 
    review = Review.find(params[:id])
    review.update(
      comment: params[:comment],
      rating: params[:rating]
    )
    review.to_json(include: :user)
  end

end
