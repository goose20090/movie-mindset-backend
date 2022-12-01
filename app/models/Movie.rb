class Movie < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def get_average_rating 
        self.reviews.sum(:rating) / self.reviews.count.to_f
    end

    def get_reviews_with_user
        self.reviews.map do |review|
            index = self.reviews.index(review)
            user = self.users[index]
            {review: review, user: user}
        end
    end

    def get_reviews_with_user_and_average_rating
        {reviews_and_users: self.get_reviews_with_user, average_rating: self.get_average_rating}
    end
end