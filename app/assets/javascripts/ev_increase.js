$(document).ready(function(){
  addEv();
  addHordeEv();
})

var addEv = function(){
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
        $("." + stat + "_value").text(pokemon.evs[stat]);
      }
    })
  })
}

var addHordeEv = function(){
  $("#log").on("click", function(){
    var evId = $("#species").val();
    var amount = $("#amount").val();
    var url  = document.URL.split('/')
    var id   = url[url.length - 1]
    var postParams = { pokemonId: id, pokemon: {evs: evId, amount: amount}}
    $.ajax({
      type: 'POST',
      url: '/pokemon/' + id + '/increase_evs',
      data: postParams,
      success: function(response) {
        stat = response.stat
        $("." + stat + "_value").text(response.pokemon.evs[stat]);
      }
    })
  })
}