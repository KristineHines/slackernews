helpers do

def all_post
   
  # Post.find(:all, :order => 'created_at DESC')
  @post = Post.paginate(:page => params[:page], :per_page => 15, :order => 'created_at DESC')
  
end

def current_user
  @current_user ||= User.find(session[:slacker_id]) if session[:slacker_id]
end


end
