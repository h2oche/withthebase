# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.new
user1.account = '유저1'
user1.password = '1234'
user1.email = '유저1@야알못.com'
user1.name = '오유저'
user1.save

user2 = User.new
user2.account = '유저2'
user2.password = 'asdf'
user2.email = '유저2@멋사.com'
user2.name = '미스터번'
user2.save

room1 = room.new
room1.name = '멋사모여라'
room1.adminid = '유저1'
room1.room_pw = 'smile'
room1.mode = 'Private'
room1.size = 2
room1.save
