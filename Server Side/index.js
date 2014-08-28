 
 
 
 var server = require("./server");
 var router =require("./router");

 var requestHandler= require("./requestHandlers");
 var handle= {} 
 handle["/upload"] = requestHandler.upload ;
 handle["/show"]= requestHandler.show;

 
 server.start(router.route, handle);
 