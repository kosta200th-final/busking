(function($){
    $(function(){

        var $aside = $('aside'),
            $btn = $('.btn');
        
        $aside.hide();
        
        $btn.on('click', function(){
        
            var e = $btn.index(this);
            
            $aside.eq(e).toggle(500);
             
             if($(this).val()=="DETAILED")
            {
                $(this).val("CLOSE");
            } else {
                $(this).val("DETAILED");
            }
        });
        
    });
})(jQuery);