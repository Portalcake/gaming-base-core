# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create(:tld=>"en", :name=>"English")
Language.create(:tld=>"de", :name=>"Deutsch")

Game.create(:token=>"ro2", :name=>"Ragnarok 2")
Game.create(:token=>"rose", :name=>"Rush on Seven Episodes")
