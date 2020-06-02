require 'open-uri'
require 'faker'

puts 'running seed...'

Post.destroy_all
User.destroy_all

# a = 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1588924445/5_w8xgdm.mp4'

puts 'Creating users...'

User.create!(username: 'alonzuman', email: "alonzuman7@gmail.com" , password: '123456', first_name: 'Alon' , last_name: 'Zuman')

10.times do
  User.create!(email: Faker::Internet.email, password: '123456', username: Faker::Name.unique.name.gsub(/\s+/, ""), first_name: Faker::Name.name , last_name: Faker::Name.name)
end

puts 'Creating posts...'

post_data = [
  {
    description: 'Baking pizza',
    url: 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1589523736/seed/MMF1HfnV9zzHbfcgs743Z4Fn.mp4'
  },
  {
    description: 'Oreo candy',
    url: 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1589523190/seed/J81DNUqNDZ1Wdxafj1HGU2YH.mp4'
  },
  {
    description: 'Chocolate cake',
    url: 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1588924445/seed/5_w8xgdm.mp4'
  },
  {
    description: 'Yummy!',
    url: 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1588924442/seed/3_varqvg.mp4'
  },
  {
    description: 'Nice coffee',
    url: 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1588924437/seed/6_smdl7o.mp4'
  },
  {
    description: 'Nutella cookies',
    url: 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1588924428/seed/4_lmbved.mp4'
  },{
    description: 'Iced coffee!',
    url: 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1588924438/seed/1_yk0moi.mp4'
  }
  

]

post_data.each do |data|
  post = Post.new(user: User.all.sample, description: data[:description])
  file = URI.open(data[:url])
  post.video.attach(io: file, filename: 'video')
  post.save!
  puts "Created post: #{post.description}"
end



puts 'finished seed...'
