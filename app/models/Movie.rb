class Movie < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    # Gets a movie's average rating across all it's reviews
    def get_average_rating 
        self.reviews.sum(:rating) / self.reviews.count.to_f
    end

    # Creates a hash of each review, paired with its parent user and returns all in an array
    def get_reviews_with_user
        self.reviews.map do |review|
            index = self.reviews.index(review)
            user = self.users[index]
            {review: review, user: user}
        end
    end

    # Creates a hash of an array each review, paired with its user and the average rating of all reviews

    def get_reviews_with_user_and_average_rating
        {reviews_and_users: self.get_reviews_with_user, average_rating: self.get_average_rating}
    end
end