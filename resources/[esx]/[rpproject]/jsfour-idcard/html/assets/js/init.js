$(document).ready(function(){
  // LUA listener
  window.addEventListener('message', function( event ) {
    if (event.data.action == 'open') {
      var type        = event.data.type;
      var userData    = event.data.array['user'][0];
      var licenseData = event.data.array['licenses'];
      var sex         = userData.sex;

      if ( type == 'driver' || type == 'health' || type == null) {
        $('img').show();
        $('#name').css('color', '#282828');

        if ( sex.toLowerCase() == 'm' ) {
          $('img').attr('src', 'assets/images/male.png');
          $('#sex').text('M');
        } else {
          $('img').attr('src', 'assets/images/female.png');
          $('#sex').text('F');
        }

        $('#name').text(userData.firstname + ' ' + userData.lastname);
        $('#dob').text(userData.dateofbirth);
        $('#height').text(userData.height);
        $('#signature').text(userData.firstname + ' ' + userData.lastname);

        if ( type == 'driver' ) {
          if ( licenseData != null ) {
          Object.keys(licenseData).forEach(function(key) {
            var type = licenseData[key].type;

            if ( type == 'drive_bike') {
              type = 'bike';
            } else if ( type == 'drive_truck' ) {
              type = 'truck';
            } else if ( type == 'drive' ) {
              type = 'car';
            }

            if ( type == 'bike' || type == 'truck' || type == 'car' ) {
              $('#licenses').append('<p>'+ type +'</p>');
            }
          });
        }

          $('#id-card').css('background', 'url(assets/images/license.png)');
        } 
        else if (type == 'health') {
          $('#id-card').css('background', 'url(assets/images/health.png)');
        }
        else {
          $('#id-card').css('background', 'url(assets/images/idcard.png)');
        }
      }
      else if ( type == 'weapon' ) {
        var licenses = [];
        $('img').hide();
        $('#name').css('color', '#d9d9d9');
        $('#name').text(userData.firstname + ' ' + userData.lastname);
        $('#dob').text(userData.dateofbirth);
        $('#signature').text(userData.firstname + ' ' + userData.lastname);

        Object.keys(licenseData).forEach(function(key) {
          var type = licenseData[key].type;

          if ( type == 'weapon_a') {
            type = 'A';
          } else if ( type == 'weapon_b' ) {
            type = 'B';
          } else if ( type == 'weapon_c' ) {
            type = 'C';
          } else if ( type == 'weapon_d' ) {
            type = 'D';
          }

          if ( type == 'A' || type == 'B' || type == 'C' || type == 'D' ) {
            licenses.push(type);
          }
        });

        $('#licenses').append('<p>'+ licenses.sort().join(', ') +'</p>');

        $('#id-card').css('background', 'url(assets/images/firearm.png) no-repeat');
        $('#licenses p').css('color', 'black');
      }

      $('#id-card').show();
    } else if (event.data.action == 'close') {
      $('#licenses p').css('color', '#9e9e9e');
      $('#name').text('');
      $('#dob').text('');
      $('#height').text('');
      $('#signature').text('');
      $('#sex').text('');
      $('#id-card').hide();
      $('#licenses').html('');
    }
  });
});
