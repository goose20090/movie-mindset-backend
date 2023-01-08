class MoviesController < ApplicationController

    # Returns all movies
    get "/movies" do
        movies = Movie.all
        movies.to_json(include:{reviews: {include: :user}})
    end
end