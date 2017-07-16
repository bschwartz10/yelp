class RestaurantsController < ApplicationController

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      head :no_content
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :city, :state, :zip).merge(user_id: current_user.id)
  end

end
