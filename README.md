MOAudioUploadStreamer
=====================

An HTTP audio Streamer from iOS to server 
I used simpleURLConnection provided by Apple and modified it 
(a little) so we can use it with audio dynamically (not already saved audio files) from the 'microphone'
to the HTTP Server ... 
in this project I used an audio file but as a buffer and for saving audio also ...
I used kAudioFormatAppleIMA4 (I found it the best)and you may use any format you want but you need to go inside the code and make 
your modification..

you may use the SpeakHere example provided by apple to capture the audio buffers from the mic and send without a need for an intermediate file 
but that wont be necessary and add more complexity to the code ..


HOW TO USE
==========

Simple way:Drag drop AudioStreamer classes to your project
Harder but better : AudioStreamer is a 'framework' so you can drag drop AudioStremaer project into your project
then add it to the 'Target Dependencies' and to 'Link Binary Libraries" 

And you need to specify the header search paths for the AudioStreamer ..


In your project import the AudioStreamer 

-if you used the simple way ( I guess you did )
just type 
'#import "MOAudioStreamer."

<else> 
type
'#import <AudioStreamer/AudioStreamer.h>

and invoke MOAudiostreamerDelegate 

OK now lets use the streamer

FIRST: declare and initialize

MOAudioStreamer *_moAudioStreamer=[MOAudioStreamer new];

you need to set some crucial properties 
_moAudioStreamer.streamerDelegate=self;
_moAudioStreamer.recordingPath=yourpath;
_moAudioStreamer.webServiceURL=yourServiceURL;
_moAudioStreamer.fileToSaveName=@"somename";//optional if you dont need to track the files recorded

in my webservice I need credential ,if you dont go to postRequestWithURL: method and change it 
so if you use it you can specify the password/username

_moAudioStreamer.userName=@"ur username";
_moAudioStreamer.password=@"your encrypted/non-encrypted password";

Finally 

[_moAudioStreamer startStreaming]; //to begin streaming
[_moAudioStreamer stopStreaming];//to stop streaming


Dont Forget to watch out the delegates ..and thats it :)

please make your suggestions to improve and simplify the MOAudioStreamer ..
Best wishes

LICENSE
========
MIT License 