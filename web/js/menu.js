$(document).ready(function () {
    $('.nav-trigger').click(function () {
        $('.side-nav').toggleClass('visible');
    });
});

function verificaHora()
{
    stamp = new Date();
    var hours;
    var time;
    hours = stamp.getHours();

    if (hours >= 18 && hours < 24) {
        time = " Boa Noite ";
    }

    if (hours >= 12 && hours < 18) {
        time = " Boa Tarde ";
    }

    if (hours >= 0 && hours < 12) {
        time = " Bom Dia ";
    }

    document.write(time);
}