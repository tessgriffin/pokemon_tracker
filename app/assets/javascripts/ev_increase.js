$(document).ready(function(){
  $(".ev_inc").on("click", function(){
    var stat = $(this).attr('data-stat')
    var val  = $(this).attr('data-value')
    var url  = document.URL.split('/')
    var id   = url[url.length - 1]
    var postParams = { post: {pokemonId: id, pokemon: {ev: stat, value: val} }}
    $.ajax({
      type: 'POST',
      url: '/pokemon/' + id + '/add_ev',
      data: postParams,
      success: function(pokemon) {
        $("#" + stat + "_value").text(pokemon.evs[stat]);
      }
    })
  })
})