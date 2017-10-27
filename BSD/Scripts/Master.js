function pageLoad() {
    $('[id*=ContactProject]').select2();
}

function Notify(message, Type, id) {
    $.notify(message, { type: Type, delay: 3000, animationType: "scale" });
    $('[id*=' + id + ']')[0].scrollIntoView();
}

function Notify(message, Type) {
    $.notify(message, { type: Type, delay: 4000, animationType: "scale" });
}