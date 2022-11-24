puts "🌱 Seeding spices..."

# Seed your database here

streaming_services = ["Disney+", "Netflix", "Amazon Prime"]
genres = ["Action", "Horror", "Drama", "Thriller", "Western", "Sci-Fi", "Comedy", "Crime", "Romance", "Adventure"]
50.times do

    movie = Movie.create(
        title: Faker::Movie.title,
        genre: genres[rand(10)],
        streaming_platform: streaming_services[rand(3)],
        release_date: Faker::Date.between(from: 80.years.ago, to: Date.today)
    )

    rand(1..5).times do
        Review.create(
            rating: rand(1..5),
            comment: Faker::Lorem.sentence,
            movie_id: movie.id
        )
    end
end

puts "✅ Done seeding!"
