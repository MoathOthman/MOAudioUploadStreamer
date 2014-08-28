 

var http = require("http");
var url = require("url");

function start(route,handle){

function onRequest(request, response) {
   var pathname = url.parse(request.url).pathname;
   var postData = "";
   console.log("Request for " + pathname + " received.");
 
route(handle, pathname, response, postData,request);
 
 }

http.createServer(onRequest).listen(8213);	
console.log("Server has started.");

}

exports.start =start;




