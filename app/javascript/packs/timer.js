
const current_path = window.location.pathname

	var min = 0
	var sec = 0
	let time = 0
	let myVar
	let db

$(document).ready(function(){
	duration = $('#cs_duration').data('source')
	time_e = $('#cs_time_elapsed').data('source')

	console.log(duration + " " + time_e)
	time = duration - time_e
	myVar= setInterval(updatetimer, 1000);
	db= setInterval(update_db, 10000);
});

function updatetimer()
{
	if(current_path != location.pathname) {
    clearInterval(myVar);
    clearInterval(db);
    return;
  }
	min = Math.floor(time / 60);
	sec = time % 60;
	timer.innerHTML = `${min}:${sec}`;
	time--;
	console.log(time)
	if (time <= 0)
	{
		cs = ($('#cs_id').data('source'))
		link = "/auto_submit/"+cs
		clearInterval(myVar);        
    clearInterval(db);
		jQuery.ajax(
		{
      url: link,
	  	data: {casestudy_user: cs ,authenticity_token: AUTH_TOKEN },
      type: "POST",
      success: function(data) 
      {
        console.log("Successful call to auto_submit");
      },
      failure: function() 
      {
        console.log("Unsuccessful call to auto_submit");
      }
  	}); 
	}
}

function update_db() {
	if(current_path != location.pathname) 
	{
    clearInterval(myVar);        
    clearInterval(db);
    return;
  }
	duration = $('#cs_duration').data('source')
  time_e = $('#cs_time_elapsed').data('source')
	cs = ($('#cs_id').data('source'))
	console.log
	new_time = duration - time_e - (min*60 + sec)
  console.log(duration + " " + time_e +" "+ new_time)
	jQuery.ajax(
	{
      url: '/update_time',
	  	data: {time: time_e + new_time,casestudy_user: cs ,authenticity_token: AUTH_TOKEN },
      type: "POST",
      success: function(data) 
      {
        console.log("Successful call to update_time");
      },
      failure: function() 
      {
        console.log("Unsuccessful call to update_time");
      }
  }); 
} 


		

