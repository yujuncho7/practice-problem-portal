class UserAuthenticator

  def initialize(user)
    @user = user
  end

  def authenticate(password)
    return false unless @user
    if @user.password == password
      return true
    end
    return false
  end

end
