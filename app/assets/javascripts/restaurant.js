function Restaurant(restaurant) {
  this.id = restaurant.id
  this.name = restaurant.name
  this.cuisine = restaurant.cuisine
  this.city = restaurant.city
  this.state = restaurant.state
  this.zip = restaurant.zip

  Restaurant.prototype.createRestaurant = function() {
    // $('.restaurants').on('click','.submit-restaurant', function(event) {
    //   event.preventDefault()
    //   const name = $('input[name="name"]').val()
    //   const cuisine = $('input[name="cuisine"]').val()
    //   const city = $('input[name="city"]').val()
    //   const state = $('input[name="state"]').val()
    //   const zip = $('input[name="zip"]').val()

      $.ajax({
        type: "POST",
        url: `/restaurants`,
        dataType: "json",
        data: { restaurant: {
                name: this.name,
                cuisine: this.cuisine,
                city: this.city,
                state: this.state,
                zip: this.zip
            }
        },
        success: function(restaurantObject) {
          return new Restaurant(restaurantObject)
        }
    })
  }
}
