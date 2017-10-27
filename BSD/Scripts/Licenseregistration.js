function success(mesg) {
    notie.alert(1, mesg, 6);
}
function success2(mesg,counter) {
    notie.alert(1, mesg, counter);
}
function error(mesg) {
    notie.alert(3, mesg, 4);
}
function warning(mesg) {
    notie.alert(2, mesg, 3);
}
$(document).ready(function () {
    if ($('[data-toggle="popover"]').length >0){
    $('[data-toggle="popover"]').popover();
}
    Imp();
});

$('html').on('mouseup', function (e) {
    if (!$(e.target).closest('.popover').length) {
        $('.popover').each(function () {
            $(this.previousSibling).popover('hide');
        });
    }
});
function validateDot(evt) {
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;

    if (evt.keyCode == 8 || evt.keyCode == 46 || evt.keyCode == 37 || evt.keyCode == 39) {
        return true;
    }

    key = String.fromCharCode(key);

    var regex = /[a-zA-Z0-9\s\.\&\-]+/gi;
    //    var regex = /[a-zA-Z]|\d|\s|\.|'|&/;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault) theEvent.preventDefault();
    }
}


function pageLoad() {
    Imp();
    if ($('[data-toggle="popover"]').length > 0) {
        $('[data-toggle="popover"]').popover();
    }
}



function Imp() {
    // Forbid copy paste
    $('input').not('#authID').bind("cut copy paste", function (e) {
        e.preventDefault();
    });

    // Forbid spaces from being added
    $("input").not('#BsnsName').keydown(function (e) {
        if (e.keyCode == 32) {
            e.preventDefault();
            return false; // return false to prevent space from being added
        }
    });
}

$('#UserName').keypress(function (e) {
    var regex = new RegExp("^[a-zA-Z0-9]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
        return true;
    }
    e.preventDefault();
    return false;
});

$('#Password').keypress(function (e) {
    if (e.which == 13) {
        return true;
    }
    var regex = new RegExp("^[a-zA-Z0-9]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
        return true;
    }
    e.preventDefault();
    return false;
});


$('#City').keypress(function (e) {
    var regex = new RegExp("^[a-zA-Z\s]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
        return true;
    }
    e.preventDefault();
    return false;
});
 