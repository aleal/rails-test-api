class ApplicationController < ActionController::API
  before_action :authenticate_request 

  attr_reader :current_user, :current_token

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    @current_token = request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end 

end
