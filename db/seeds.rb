# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
 
 # Create Posts
 50.times do
   Post.create!(
      title: "Ullam non quos aut.",
 			body: "A itaque sit necessitatibus ut. Quos fuga labore qui 
 				ab cupiditate voluptate perferendis. Omnis maxime sunt et. 
 				Omnis similique non sit qui ipsam sed.",
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: "Cupiditate recusandae tenetur vero ut eaque iusto amet. 
     	 Architecto voluptas esse nostrum aperiam. Est iure nesciunt 
     	 consectetur.",
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"