puts "🌱 Seeding spices..."

# Seed your database here

streaming_services = ["Disney+", "Netflix", "Amazon Prime"]
genres = ["Action", "Horror", "Drama", "Thriller", "Western", "Sci-Fi", "Comedy", "Crime", "Romance", "Adventure"]
50.times do

    Movie.create(
        title: Faker::Movie.title,
        genre: genres[rand(10)-1],
        streaming_platform: streaming_services[rand(3)-1],
        release_date: Faker::Date.between(from: 80.years.ago, to: Date.today)
    )
end

puts "✅ Done seeding!"
