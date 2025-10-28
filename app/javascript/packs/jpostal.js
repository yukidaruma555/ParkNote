function jpostal() {
  $('#park_postal_code').jpostal({
    postcode : ['#park_postal_code'],
    address : {
      '#park_address': '%3%4%5'
    }
  });
}
$(document).on("turbolinks:load", jpostal);
console.log('jpostal')