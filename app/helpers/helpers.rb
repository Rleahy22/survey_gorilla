def current_user
  User.find(session[:id])
end

def signed_in?
  current_user
end
