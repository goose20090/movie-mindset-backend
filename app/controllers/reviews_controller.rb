class ReviewsController < ApplicationController

    # Creates a new review
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