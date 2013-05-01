
get "/user/signup" do
  erb :signup
end

post "/user/create" do
  testcase = User.create(params)
  redirect "/user/login"
end

get "/user/login" do
  erb :login
end

post "/user/login" do
  if @user = User.find_by_username(params[:username])
      if @user.password == params[:password]
    session[:slacker_id] = @user.id
    redirect("/")
      else
        @error = "Login or Password is not correct"
        erb :login
      end
  else
    @error = "User does not exist."
    erb :login
  end
end

get "/user/logout" do
  session.clear
  p session
  redirect to "/"
end

get "/user/profile" do
  @user = User.find(session[:slacker_id])
  erb :profile
end



