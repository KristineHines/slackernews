get '/post/create' do
  erb :post_create
end

post '/post/create' do
@url = params[:url].sub(/(https?:\/\/)/, '')
@post = current_user.posts.build(:url => @url, :post_body => params[:post_body], :title => params[:title])
  unless @post.save
    erb :post_create
  else 
   redirect "/post/#{@post.id}}"
  end
end

get "/post/:id" do
  @post = Post.find(params[:id])
  erb :post_view
end

post "/post/:id/comment" do
  post = Post.find(params[:id])
  post.comments << current_user.comments.create(:comment_body => params[:comment_body])
  redirect "/post/#{params[:id]}}"

end
