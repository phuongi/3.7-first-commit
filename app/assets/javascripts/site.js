var refreshRating = function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
            return $(this).attr('data-score');
       }
    });
}

$(document).ready(function() { // All your code here });
    refreshRating();

    $('.img-zoom').elevateZoom();
});