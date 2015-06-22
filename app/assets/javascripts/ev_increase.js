$(document).ready(function(){
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
  });
});