

function route(handle,pathname,response,postData,request){
	
	console.log("About to route a request for path : " +pathname);
	
	if (typeof handle[pathname] === 'function') {
       
        
           handle[pathname](response,postData,request);
 }else{
        console.log("No request handler found for " + pathname);
        response.writeHead(404, {"Content-Type": "text/plain"});
		response.write("404 Not found");
        response.end();
 }


	
}

exports.route =route;