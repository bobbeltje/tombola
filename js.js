function make_card(m, id){
    var card = '';
    for (var i = 0; i < 3; i++){
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
        '<span class="number"><div class="centered">' +
         ((x == "NA") ? 'X' : x) + 
         '</div></span>' +
        '</div></div>';
}
