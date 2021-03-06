# app/commands/authorize_api_request.rb 
class AuthorizeApiRequest 
  
  prepend SimpleCommand 
  
  def initialize(headers = {}) 
    @headers = headers 
  end 
  
  def call 
    user 
  end 

  private 
 
  attr_reader :headers 

  def user 
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end 

  def decoded_auth_token 
    @decoded_auth_token ||= JsonWebToken.decode(get_auth_token) 
  end 

  def get_auth_token 
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?  
    
    errors.add(:token, 'Missing token') 
    nil 
  end 
end
