$(document).ready(function(){

    // Calling our splashScreen plugin and
    // passing an array with images to be shown

    $('#promoIMG').splashScreen({
        textLayers : [
            'img/pleasewait.png',
            'img/whilewe.png',
            'img/andupdate.png'
        ]
    });

});