function Restaurant(restaurant) {
  this.id = restaurant.id
  this.name = restaurant.name
  this.cuisine = restaurant.cuisine
  this.city = restaurant.city
  this.state = restaurant.state
  this.zip = restaurant.zip

  Restaurant.prototype.createRestaurant = function() {
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
          const restaurant = new Restaurant(restaurantObject)
          restaurant.appendRestauantToPage()
              $('input[name="name"]').val("")
              $('input[name="cuisine"]').val("")
              $('input[name="city"]').val("")
              $('input[name="state"]').val("")
              $('input[name="zip"]').val("")
        }
    })
  }
  Restaurant.prototype.appendRestauantToPage = function() {
    $('.restaurants').append(
    `<h4>${this.name}</h4>
    <p>${this.cuisine}</p>
    <p>${this.city}</p>
    <p>${this.state}</p>
    <p>${this.zip}</p>`
  )}
}
