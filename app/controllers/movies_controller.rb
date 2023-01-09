class MoviesController < ApplicationController

    streaming_services = ["Disney+", "Netflix", "Amazon Prime"]
genres = ["Action", "Horror", "Drama", "Thriller", "Western", "Sci-Fi", "Comedy", "Crime", "Romance", "Adventure"]

    # Returns all movies
    get "/movies" do
        movies = Movie.all
        movies.to_json(include:{reviews: {include: :user}})
    end

    post "/movies" do
        movie = Movie.create(
        title: params[:title],
        genre: genres[rand(10)],
        streaming_platform: streaming_services[rand(3)],
        release_date: Faker::Date.between(from: 80.years.ago, to: Date.today)
        )
        movie.to_json(include:{reviews: {include: :user}})
    end
end