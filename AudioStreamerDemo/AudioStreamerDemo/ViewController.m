//
//  ViewController.m
//  AudioStreamerDemo
//
//  Created by MO on 7/19/14.
//  Copyright (c) 2014 com.w. All rights reserved.
//

#import "ViewController.h"
#import <AudioStreamer/MOAudioStreamer.h>
#define recordedAudioFilesDir [NSHomeDirectory() stringByAppendingPathComponent:@"tmp/recordedSounds"]

@interface ViewController ()<MOAudioStreamerDeelegate>
{
 
    MOAudioStreamer *_moAudioStreamer;
    BOOL iscalling;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _moAudioStreamer=[MOAudioStreamer new];
    _moAudioStreamer.streamerDelegate=self;
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)audioCleanUp{
     if (_moAudioStreamer) {
        [_moAudioStreamer.recorder stop ];
        _moAudioStreamer->StopSignal=1;
        _moAudioStreamer.connection=nil;
        _moAudioStreamer=nil;
    }
    
 
}

-(IBAction)stop{
    
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    taskQ = dispatch_queue_create("stopRecordingAndEncodingAndUploading", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(taskQ, ^{
        
        [_moAudioStreamer stopStreaming];
    });
    
    
    
}

- (IBAction)recordAudio:(id)sender {
    
    /*to prevent the device from going to sleep*/
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
 
     [self callAndInitiAudioStreame];
 
    
    
}
-(void)callAndInitiAudioStreame {
    
      _moAudioStreamer=nil;
    _moAudioStreamer=[MOAudioStreamer new];
    _moAudioStreamer.streamerDelegate=self;
    _moAudioStreamer.expectingTimeOut= 30;
    _moAudioStreamer.recordingPath=recordedAudioFilesDir;
    _moAudioStreamer.webServiceURL =[NSURL URLWithString:@"http://localhost:8213/upload"];
     // Open a connection for the URL, configured to POST the file.
    
    //Start Streaming
    [_moAudioStreamer startStreamer];
    
}
#pragma mark AudioStreamer Delegate

-(void)MOAudioStreamerDidFinishStreaming:(MOAudioStreamer *)streamer{
#if RELEASE_Version == 0
    NSLog(@"audio streamer did finish streaming audio file");
#endif
}
-(void)MOAudioStreamerDidFailed:(MOAudioStreamer *)streamer message:(NSString *)reason {
    /*add to log file */
     /*check if the failure coused by a time out */
    
    if ([reason rangeOfString:@"timed out"].location!=NSNotFound) {
        
    }
    
     NSLog(@"audio streamer did fail with error %@",streamer->connectionError.description);
 }
-(void)MOAudioStreamerDidFinishRequest:(NSURLConnection *)connectionRequest withResponse:(NSString *)response{
    
    NSLog(@"audioStreamFinished with response %@",response);
    
    _resultTextView.text=response;
}



@end
