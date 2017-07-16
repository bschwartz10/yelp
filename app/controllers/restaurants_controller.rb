class RestaurantsController < ApplicationController
  
  def create
    @restaurant = Restaurant.new(restaurant_params)

  respond_to do |format|
      if @restaurant.save
        format.html { redirect_to root_path, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end


  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :city, :state, :zip).merge(user_id: current_user.id)
  end

end
