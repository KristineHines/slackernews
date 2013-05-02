require 'Faker'

20.times do
  User.create(:username => Faker::Internet.user_name,
                :password_hash => Faker::Lorem.word,
                :email => Faker::Internet.email,
                :about => Faker::Lorem.paragraph
                )
end

20.times do 
  Post.create(:title => Faker::Lorem.words.join(' '),
                  :post_body => Faker::Lorem.paragraph
                  )
end

20.times do 
  Post.create(:title => Faker::Lorem.words.join(' '),
                  :url => Faker::Internet.domain_name
                  )
end

40.times do
  Comment.create(:comment_body => Faker::Lorem.paragraph                 
    )
end

80.times do
  comment = Comment.all.sample
  comment.post = Post.all.sample
  comment.save
end

80.times do
  user = User.all.sample
  user.posts << Post.all.sample
end


80.times do
  comment = Comment.all.sample
  comment.user = User.all.sample
  comment.save
end

