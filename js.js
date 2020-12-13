decks = {
    'Cat': 1,
    'Dog': 2,
    'Mouse': 3
}
function make_card(m, id, idx){
    var card = '';
    idx = 3 * (idx - 1);
    for (var i = idx; i < (idx + 3); i++){
        card += make_row(m[i]);
    }
    $('#'+id).append(card);
}
function make_row(x){
    var row = '<div class="myrow">';
    for (var i = 0; i < x.length; i++){
        row += make_number(x[i]);
    }
    row += '</div>';
    return row;
}
function make_number(x){
    return '<div class="num-box"><div class="num-dummy">' +
    '<span class="number' + 
    ((x == "NA") ? '' : ' value') + 
    '"><div class="centered">' +
     ((x == "NA") ? '' : x) + 
     '</div></span>' +
    '</div></div>';
}
function set_card_width(val){
    $('.card-container').css('width', val+'vw');
}
function go_tombola(){
    var x = decks[$('#deck-dropdown').attr('choice')];
    if (x == undefined) return;
    $.getJSON('www/' + x + '.json', function load_cards(data) {
      // globalThis.cards = data;
      make_card(data, 'card1', 1);
      make_card(data, 'card2', 2);
      make_card(data, 'card3', 3);
      make_card(data, 'card4', 4);
      make_card(data, 'card5', 5);
      make_card(data, 'card6', 6);
      $('#landing').css('display', 'none');
      $('#tombola').css('display', 'inline-block');
    });
}
