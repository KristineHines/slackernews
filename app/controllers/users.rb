
post "/user/create" do
  @user = User.new(params)
  @user.save
  if @user.save
    session[:slacker_id] = @user.id
    redirect("/")
  end
end

get "/user/login" do
  erb :login
end

post "/user/login" do
  current_user = User.authenticate(params[:username], params[:password])

  if current_user
    session[:slacker_id] = current_user.id
    redirect("/")
  else
    @error = "Login or Password is not correct"
    erb :login
  end
end






get "/user/logout" do
  session.clear
  p session
  redirect to "/"
end

get "/user/:id" do
  @user = User.find(params[:id])
  erb :profile
end



