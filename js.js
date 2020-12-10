function make_card(m, id){
    console.log('marking card');
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
    console.log(x);
    return '<span class="number">' + ((x == "NA") ? 'X' : x) + '</span>';
}
