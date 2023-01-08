class UsersController < ApplicationController
    
    # Returns all users with their reviews and relevant movies
    get "/users" do
        users = User.all
        users.to_json(include:{reviews: {include: :movie}})
    end
    
    # Creates a new user
    post "/users" do
        user = User.create(
          name: params[:name],
          avatar: Faker::Avatar.image,
        )
        user.to_json(include:{reviews: {include: :movie}})
    end
end