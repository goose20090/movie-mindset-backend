class User < ActiveRecord::Base
    has_many :reviews
    has_many :movies, through: :reviews

    # Returns a hash of a users' reviews, paired with it's corresponding movie
    def get_reviews_with_movie
        self.reviews.map do |review|
            index = self.reviews.index(review)
            movie = self.movies[index]
            {review: review, movie: movie}
        end
    end
end