
 var fs = require("fs");
 
  
function upload(response,postData,request){
 	  
 var file;
console.log('Start Upload Sound');

path = './upload/' + 'test21' + '.wav';

file = fs.createWriteStream(path);

request.pipe(file);

request.on('end', function(error, data) {
    console.log("upload Done");
response.writeHead(200, {"Content-Type": "image/png"});
response.end();

});

 

	 
 };



function show(response,request){

 
response.writeHead(200, {"Content-Type": "audio/wav"});
path = './upload/' + 'test21' + '.wav';

fs.createReadStream(path).pipe(response);

}

 
exports.upload=upload;

exports.show=show;


