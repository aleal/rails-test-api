class AuthenticateUser 
  
  prepend SimpleCommand 

  def initialize(credentials)
    @email = credentials[:email]
    @password = credentials[:password]
  end

  def call
      user = check_credentials
      {token: JsonWebToken.encode(user_id: user.id), user: user} if user
  end

  private

  attr_accessor :email, :password

  def check_credentials
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :authentication, 'Invalid credentials'
    nil
  end  
end
