
function OpenModalWithOptions_X(option) {

    if (option != 'SAR' && option != 'SWP') { // Business Profiles
        $('#BSDSetup').modal('show');
    }
    if (option == 'SAR') {
        $('#SAR').modal('show');
    }
    if (option == 'SWP') {
        $('#SWP').modal('show');
    }
}

function OpenModalWithOptions(option, page) {
    if (option == '0') { // Business Profiles
        $('#BSDSetup').modal('show');
    }
    if (option == '1') { // Business Profiles
        $('#BSDSetup').modal('show');
        $('#SSetupChild').slideToggle();
        $('#MBP').slideToggle();
    } else if (option == '2') {
        $('#BSDSetup').modal('show');
        $('#SSetupChild').slideToggle();

    } else if (option == '3') {
        $('#BSDSetup').modal('show');
        $('#SSetupChild').slideToggle();
        $('#MMPS').slideToggle();
    } else if (option == '8') {
        $('#BSDSetup').modal('show');
        $('#SSetupChild').slideToggle();
        $('#MQL').slideToggle();
    } else if (option == '4') {
        $('#SAR').modal('show');
    } else if (option == '5') {
        $('#RM').modal('show');
    } else if (option == '6') {
        $('#SWP').modal('show');
    } else if (option == '9') {
        $('#BSDSetup').modal('show');
        $('#SSetupChild').slideToggle();
        $('#MSAManagement').slideToggle();
    }


    $('.' + page + ',#' + page).addClass('activeBox');
    $('.' + page + ',#' + page).find('.desc').css({
        'background': '#464545',
        'color': 'white',
        'border-top-color': '#464545'
    });

    $('#' + page + ',.' + page).not('li').parent().parent().prepend("<div class='arrow-down'></div>");

    var a = $('#' + page).parent().parent().parent().attr('id') + '_P';


    $('#' + a).addClass('activeBox');
    $('#' + a).prepend("<div class='arrow-down'></div>");

    $('.' + page + ',#' + page).parents('.parentcard').find('h2').css('color', 'black');
    $('#' + a).parents('.parentcard').find('h2').css('color', 'black');

}

$(document).ready(function () {

    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="tooltip"]').tooltip();
    var countMMPS = $('#MMPS a.disabledAnc').children().length;
    var countMBP = $('#MBP a.disabledAnc').children().length;
    var countMQL = $('#MQL a.disabledAnc').children().length;

    var count1 = 0;
    var count2 = 0;
    var count3 = 0;


    $('#MMPS a.disabledAnc').each(function () {
        count1 = count1 + 1;
    });
    $('#MBP a.disabledAnc').each(function () {
        count2 = count2 + 1;
    });
    $('#MQL a.disabledAnc').each(function () {
        count3 = count3 + 1;
    });


    if (count1 != 0 && countMMPS == count1) {
        $('#MMPS_P').addClass('disabledAnc');
    }
    if (count2 != 0 && countMBP == count2) {
        $('#MBP_P').addClass('disabledAnc');
    }
    if (count3 != 0 && countMQL == count3) {
        $('#MQL_P').addClass('disabledAnc');
    }

    $('.topNav ul li').eq(5).hide();
    $('.topNav ul li').eq(6).hide();

    $('#lView').click(function () {
        $(this).css('color', 'crimson');
        $('#TView').css('color', 'black');
        $('#ListView').show();
        $('#ThumbView').hide();
    });

    $('#TView').click(function () {
        $(this).css('color', 'crimson');
        $('#lView').css('color', 'black');
        $('#ListView').hide();
        $('#ThumbView').show();
    });

    $('#lViewS').click(function () {
        $(this).css('color', 'crimson');
        $('#TViewS').css('color', 'black');
        $('#SSetupChild .parentcard .col-md-12').show();
    });

    $('#TViewS').click(function () {
        $(this).css('color', 'crimson');
        $('#lViewS').css('color', 'black');
        $('#SSetupChild .parentcard  .col-md-12').hide();
    });

    $('#prevToSetup').click(function () {

        if (
            $('#MMPS').is(':visible') ||
                $('#MBP').is(':visible') ||
                $('#MQL').is(':visible') ||
                $('#MSAManagement').is(':visible')) {
            $('[id*=bsdMap]').html('');
            $('#SSetupChild').slideToggle();
            $('#MMPS, #MBP, #MSAManagement, #MQL').hide();
        } else {
            $('#BSDSetup').modal('hide');
            $('[id*=bsdMap]').html('');
        }
    });

    $('#RW_Back').click(function () { $('#SAR').modal('hide'); });
    $('#SWPBack').click(function () { $('#SWP').modal('hide'); });
    $('#RMBack').click(function () { $('#RM').modal('hide'); });

    $('.closeBSDSetup').click(function () {
        $('#SSetupChild').show();
        $('#MSAManagement, #MBP, #MMPS, #MQL').slideUp();
        $('[id*=bsdMap]').html('');
    });

    $('.closeBSDSetupB').click(function () {
        $('#prevToSetup').click();
    });

    $('#RWLink').click(function () {
        $('#RWDiv').slideToggle();
        $('#RW').slideToggle();
    });

    $('#RW_Back').click(function () {
        $('.closeRW').click();
    });


    $('#MBP_P').click(function () {
        $('#SSetupChild').slideToggle();
        $('#MBP').slideToggle();
        $('[id*=bsdMap]').html('&nbsp;&nbsp;||&nbsp;&nbsp;' +
            a);
    });


    $('#MMPS_P').click(function () {

        $('#SSetupChild').slideToggle();
        $('#MMPS').slideToggle();
        $('[id*=bsdMap]').html('&nbsp;&nbsp;||&nbsp;&nbsp;' + b);
    });


    $('#MQL_P').click(function () {

        $('#SSetupChild').slideToggle();
        $('#MQL').slideToggle();
        $('[id*=bsdMap]')
            .html('&nbsp;&nbsp;||&nbsp;&nbsp;' + c);
    });


    $('#notiBtn').click(function () {
        $('#notiArea').slideToggle();
    });

    $('#closeNoti').click(function () {
        $('#notiArea').slideUp();
    });
});


var a, b, c;