# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

City.destroy_all
User.destroy_all
Gossip.destroy_all
Comment.destroy_all
Tag.destroy_all
GossipTag.destroy_all
PrivateMessage.destroy_all
LikeComment.destroy_all
LikeGossip.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('City')
ActiveRecord::Base.connection.reset_pk_sequence!('User')
ActiveRecord::Base.connection.reset_pk_sequence!('Gossip')
ActiveRecord::Base.connection.reset_pk_sequence!('Comment')
ActiveRecord::Base.connection.reset_pk_sequence!('Tag')
ActiveRecord::Base.connection.reset_pk_sequence!('GossipTag')
ActiveRecord::Base.connection.reset_pk_sequence!('PrivateMessage')
ActiveRecord::Base.connection.reset_pk_sequence!('LikeComment')
ActiveRecord::Base.connection.reset_pk_sequence!('LikeGossip')

all_cities = []
all_users = []
all_gossips = []
all_comments = []
all_tags = []
all_gossip_tags = []
all_private_messages = []
all_likes_comment = []
all_likes_gossip = []

all_zip_code = ['75001', '75002', '75003', '75004', '75005', '75006', '75007', '75008', '75009', '75010'];

10.times do 
  all_cities << City.create(name: Faker::Address.city, zip_code: all_zip_code.sample)
end

10.times do
  all_users << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.word, email: Faker::Internet.email, age: rand(18..75), city: all_cities.sample)
end

20.times do
  all_gossips << Gossip.create(title: Faker::Lorem.sentence(word_count: 3), content: Faker::Lorem.sentence(word_count: 25), user: all_users.sample)
end

10.times do
  all_tags << Tag.create(title: Faker::Lorem.word)
end

all_gossips.each do |gossip|
   all_gossip_tags << GossipTag.create(gossip: gossip, tag: all_tags.sample)
end

20.times do
  sender = all_users.sample
  recipient = all_users.reject{ |i| i == sender }.sample
  all_private_messages << PrivateMessage.create(content: Faker::Lorem.sentence(word_count: 5), sender: sender, recipient: recipient)
end

60.times do 
  all_comments << Comment.create(content: Faker::Lorem.sentence(word_count: 10), user: all_users.sample, gossip: all_gossips.sample)
end

20.times do
  roll = rand(1..2)
    if roll == 1
      all_likes_comment << LikeComment.create(user: all_users.sample, comment: all_comments.sample)
    else
      all_likes_gossip << LikeGossip.create(user: all_users.sample, gossip: all_gossips.sample)
    end
end