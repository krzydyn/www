﻿function isFunction(functionToCheck) {
   var getType = {};
   return functionToCheck && getType.toString.call(functionToCheck) === '[object Function]';
}

function Ajax() {
	var r=null;
	if (window.XMLHttpRequest)
		// code for IE7+, Firefox, Chrome, Opera, Safari
		r = new XMLHttpRequest();
	else
		// old IE
		r = new ActiveXObject("Microsoft.XMLHTTP");
	this.req=r;
}

Ajax.prototype.async = function(method,url,onReady) {
   var that=this;
   try {
   this.req.open(method, url, true);
   this.req.onerror = function (ev) { /*console.log('error:'+JSON.stringify(ev));*/ };
   this.req.onreadystatechange = function () {
       var r=that.req;

       console.log('state change: '+r.readyState);
       if (r.readyState!=4) return ;
       //r.status==401 - login/password incorrect
       //console.log('req:'+JSON.stringify(r));
       //if (isFunction(onRespose)) onRespose(r.status,r.responseText);
       if (onReady) onReady(r.status,r.responseText);
       else console.log('rc='+r.satus+'reslut is: '+r.responseText);
   };
   //req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   //req.setRequestHeader("Authorization", "Basic " + base64(username) + ':' + base64(password));
   this.req.send();
   } catch(error) {
       console.log('exception:'+JSON.stringify(error));
   }
};

function arrayMin(arr) {
  var len = arr.length, min = Infinity;
  while (len--) {
    if (arr[len] < min) {
      min = arr[len];
    }
  }
  return min;
}

function arrayMax(arr) {
  var len = arr.length, max = -Infinity;
  while (len--) {
    if (arr[len] > max) {
      max = arr[len];
    }
  }
  return max;
}

