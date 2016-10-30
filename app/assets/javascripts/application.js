
///// Floating div ///////////////
// $(document).ready(function(){
//     $('.a').each(function(){ animateDiv($(this)); });
// });
//
// function makeNewPosition(){
//     var h = $(window).height() - 50;
//     var w = $(window).width() - 50;
//     var nh = Math.floor(Math.random() * h);
//     var nw = Math.floor(Math.random() * w);
//     return [nh,nw];
// }
//
// function animateDiv(ele){
//     var newq = makeNewPosition();
//     var oldq = ele.offset();
//     var speed = calcSpeed([oldq.top, oldq.left], newq);
//     ele.animate({ top: newq[0], left: newq[1] }, speed, function(){
//       animateDiv(ele);
//     });
// };
//
// function calcSpeed(prev, next) {
//     var x = Math.abs(prev[1] - next[1]);
//     var y = Math.abs(prev[0] - next[0]);
//     var greatest = x > y ? x : y;
//     var speedModifier = 0.05;
//     var speed = Math.ceil(greatest/speedModifier);
//     return speed;
// }


/////// DATE & TIME ////////////////////

// tday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
// tmonth=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
//
// tday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
// tmonth=new Array("01","02","03","04","05","06","07","08","09","10","11","12");
//
// function GetClock(){
//   var d=new Date();
//   var nday=d.getDay(),nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getYear();
//   if(nyear<1000) nyear+=1900;
//   var nhour=d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds(),ap;
//
//   if(nhour==0){ap="AM";nhour=12;}
//   else if(nhour<12){ap="AM";}
//   else if(nhour==12){ap="PM";}
//   else if(nhour>12){ap="PM";nhour-=12;}
//
//   if(nmin<=9) nmin="0"+nmin;
//   if(nsec<=9) nsec="0"+nsec;
//
//   // document.getElementById('clockbox').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+ap+"";
//   document.getElementById('clockbox').innerHTML=""+nyear+"."+tmonth[nmonth]+"."+ndate+" "+nhour+":"+nmin+":"+nsec+ap+"";
//
// }
//
// window.onload=function(){
// GetClock();
// setInterval(GetClock,1000);
// }

//// Draged TEXT /////////////
function selectText() {
  var selectionText = "";
  if (document.getSelection) {
    selectionText = document.getSelection();
  } else if (document.selection) {
    selectionText = document.selection.createRange().text;
  }
  return selectionText;
}

document.onmouseup = function() {
  var selectedText = '';
  var getSelectText = '';
  getSelectText = selectText();

  if (getSelectText != ""){
    $("#button_form").animate({width: "350px"}, "fast");
    // $("#button_form").toggle( 'slide', 'right', 500);
  }
  if (getSelectText == "") {
    $("#button_form").animate({width: "0px"}, "fast");
    // $("#button_form").fadeOut('fast');
  }


  if(getSelectText != '') {
  	selectedText = getSelectText;
  } else {
	  return;
  }
  document.getElementById("myModalLabel1").innerHTML = selectedText;
  document.getElementById("myModalLabel2").innerHTML = selectedText;
  document.getElementById("myModalLabel3").innerHTML = selectedText;
  document.getElementById("myModalLabel4").innerHTML = selectedText;

  document.getElementById("locationText1").innerHTML = selectedText;
  document.getElementById("locationText2").innerHTML = selectedText;
  document.getElementById("locationText3").innerHTML = selectedText;
  document.getElementById("locationText4").innerHTML = selectedText;
}



/// Floating div ///////////////
