class DogsController < ApplicationController
  before_action :authenticate_request
  before_action :set_dog, only: [:show, :update, :destroy]

  # GET /dogs
  def index
    @dogs = Dog.all
    users = @dogs.map{|dog| dog.user}.uniq
    data = {
	dogs: @dogs,
        users:  Hash[users.map{|user| [user.id, user]}],
        liked_dog_ids: @current_user.liked_dog_ids    
    }
    render json: data
  end

  # GET /dogs/1
  def show
    render json: @dog
  end

  # POST /dogs
  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      render json: @dog, status: :created, location: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dogs/1
  def update
    if @dog.update(dog_params)
      render json: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dogs/1
  def destroy
    @dog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dog_params
      params.require(:dog).permit(:name, :picture, :user_id)
    end
end
