# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ironman = List.create! name: "Robert Downey", author: "Big Fan", description: "Favorite super hero"
tester_1 = List.create! name: "Work now", author: "Desperate", description: "Just work"
friendly = List.create! name: "Please work", author: "Your friend", description: "Let's have beers"

