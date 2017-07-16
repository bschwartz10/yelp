
$(document).ready(function(){
  createRestaurantForm()
  $('.restaurants').on('click','.submit-restaurant', function(event) {
    event.preventDefault()
    const newRestaurant = getRestaurantFromForm()
    newRestaurant.createRestaurant()
  })
})
function createRestaurantForm() {
  $('#restaurant').click(function (event) {
    event.preventDefault()
    $('.restaurants').append(
      `<br><form> Name:<br> <input type="text" name="name"><br>
      Cusine:<br> <input type="text" name="cuisine"><br>
      City:<br> <input type="text" name="city"><br>
      State:<br> <input type="text" name="state"><br>
      Zip:<br> <input type="text" name="zip"><br>
      <br> <input type="submit" class="submit-restaurant" value="Submit"> </form>`)
    })
  }

  function getRestaurantFromForm() {
    const name = $('input[name="name"]').val()
    const cuisine = $('input[name="cuisine"]').val()
    const city = $('input[name="city"]').val()
    const state = $('input[name="state"]').val()
    const zip = $('input[name="zip"]').val()

    return new Restaurant ({
      name: name,
      cuisine: cuisine,
      city: city,
      state: state,
      zip: zip
    })

// function createRestaurant() {
//   $('.restaurants').on('click','.submit-restaurant', function(event) {
//     event.preventDefault()
//     const name = $('input[name="name"]').val()
//     const cuisine = $('input[name="cuisine"]').val()
//     const city = $('input[name="city"]').val()
//     const state = $('input[name="state"]').val()
//     const zip = $('input[name="zip"]').val()
//
//     $.ajax({
//       type: "POST",
//       url: `/restaurants`,
//       dataType: "json",
//       data: { restaurant: {
//               name: name,
//               cuisine: cuisine,
//               city: city,
//               state: state,
//               zip: zip
//           }
//       },
//       success: function(restaurantObject) {
//         return new Restaurant(restaurantObject)
//       }
//     })
//   })
// }

}
