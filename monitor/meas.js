if ('WebSocket' in window){
   /* WebSocket is supported. You can proceed with your code*/
	console.log('WebSocket supported');
} else {
   /*WebSockets are not supported. Try a fallback method like long-polling etc*/
	console.log('WebSocket NOT supported');
}

function ajax(method, url, callback){
    var xmlhttp;
    // compatible with IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function(){
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
            callback(xmlhttp.responseText);
        }
    }
    xmlhttp.open(method, url, true);
    xmlhttp.send();
}
/*
console.log('opening socket');
var socket = new WebSocket('ws://daq.if.pw.edu.pl:80/monitor/last.php');
socket.onopen = function () {
	console.log('Connection open!');
	setInterval(function() {
    if (socket.bufferedAmount == 0)
      socket.send('getlast');
	}, 1000);
};
socket.onclose = function(){
   console.log('Connection closed');
}
socket.onerror = function(error){
   console.log('Error detected: ' + error);
}
socket.onmessage = function (e) {
  console.log('Server: ' + e.data);
};
*/
