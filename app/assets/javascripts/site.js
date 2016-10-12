$(document).on('turbolinks:load', function () { // All your code here });
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
            return $('img[src*="star-on"]',$(this)).length;
       }
    });
});