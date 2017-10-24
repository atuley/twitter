# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!("email"=>"tester@example.com", "password" => "gaslight123", "password_confirmation" => "gaslight123")
User.create!("email"=>"foo@example.com", "password" => "gaslight123", "password_confirmation" => "gaslight123")

Tweet.create!("content"=>"This is my tweet", "user_id"=>1)
Tweet.create!("content"=>"I'm bored\r\n", "user_id"=>2)
Tweet.create!("content"=>"This is cool", "user_id"=>1)

Relationship.create!("follower_id"=>2, "followed_id"=>1)
Relationship.create!("follower_id"=>1, "followed_id"=>2)
