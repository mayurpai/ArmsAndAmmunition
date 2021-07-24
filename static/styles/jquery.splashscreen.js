(function($){

    $.fn.splashScreen = function(settings){

        settings = $.extend({
            textLayers      : [],
            textShowTime    : 3000,
            textTopOffset   : 80
        },settings);

        var promoIMG = this;

        var splashScreen = $('<div>',{
            id  : 'splashScreen',
            css:{
                backgroundImage     : promoIMG.css('backgroundImage'),
                backgroundPosition  : 'center '+promoIMG.offset().top+'px',
                height              : $(document).height()
            }
        });

        $('body').append(splashScreen);

        splashScreen.click(function(){
            splashScreen.fadeOut('slow');
        });

        splashScreen.bind('changeText',function(e,newID){

            if(settings.textLayers[newID]){
                showText(newID);
            }
            else {
                splashScreen.click();
            }
        }); 

        splashScreen.trigger('changeText',0);

        function showText(id){
            var text = $('<img>',{
                src:settings.textLayers[id],
                css: {
                    marginTop : promoIMG.offset().top+settings.textTopOffset
                }
            }).hide();

            text.load(function(){
                text.fadeIn('slow').delay(settings.textShowTime).fadeOut('slow',function(){
                    text.remove();
                    splashScreen.trigger('changeText',[id+1]);
                });
            });

            splashScreen.append(text);
        }

        return this;
    }

})(jQuery);