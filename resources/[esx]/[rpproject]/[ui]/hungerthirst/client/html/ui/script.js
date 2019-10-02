$(document).ready(function(){

  window.addEventListener("message", function(event){
    if(event.data.update == true){
      setProgress(event.data.faim,'.progress-hunger');
      setProgress(event.data.soif,'.progress-thirst');
      changeavatar(event.data.url);
      changejob(event.data.job, event.data.job2)
    } else if (event.data.action == "updateWeight"){
			updateWeight(event.data.weight)
		}
  });

  // Functions
  // Update health/thirst bars
  function setProgress(percent, element){
    $(element).width(percent + '%');
  }

  function updateWeight(weight){
    setProgress(weight,'.progress-inventory');
  }

  function changeavatar(avatar){
    if($( "#avatarimage" ).attr( "src" ) !== avatar){
      $('#avatarimage').attr('src', avatar);
    }  
    return false;
  }

  function changejob(job, job2){
    if($( "#job" ).html() !== job){
      $('#job').html(job);
    }
    if($( "#job2" ).html() !== job2){
      if (job2 !== 'Desempleado - Desempleado'){
        $('#job2').html(job2);
      } else {
        $('#job2').html("");
      }
    }    
    return false;
  }

  // Clock based on user's local hour
  function updateClock() {
    var now = new Date(),
        time = (now.getHours()<10?'0':'') + now.getHours() + ':' + (now.getMinutes()<10?'0':'') + now.getMinutes();

    document.getElementById('hour').innerHTML = [time];
    setTimeout(updateClock, 1000);
  }
  updateClock();

});
