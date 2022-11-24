puts "🌱 Seeding spices..."

# Seed your database here

streaming_services = ["Disney+", "Netflix", "Amazon Prime"]
genres = ["Action", "Horror", "Drama", "Thriller", "Western", "Sci-Fi", "Comedy", "Crime", "Romance", "Adventure"]


20.times do

     User.create(
        name: Faker::Name.name
    )

end

50.times do

    movie = Movie.create(
        title: Faker::Movie.title,
        genre: genres[rand(10)],
        streaming_platform: streaming_services[rand(3)],
        release_date: Faker::Date.between(from: 80.years.ago, to: Date.today)
    )


    rand(1..5).times do
        first_user = User.first
        last_user = User.last

        user = User.find(rand(first_user.id..last_user.id))

        Review.create(
            rating: rand(1..5),
            comment: Faker::Lorem.sentence,
            movie_id: movie.id,
            user_id: user.id
        )
    end
end

puts "✅ Done seeding!"
