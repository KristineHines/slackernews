get '/post/create' do
  erb :post_create
end

post '/post/create' do
@user = User.find(session[:slacker_id])
@post = @user.posts.create(params)
p @post
redirect "/post/#{@post.id}}"
end

get "/post/:id" do
  @post = Post.find(params[:id])
  erb :post_view
end

