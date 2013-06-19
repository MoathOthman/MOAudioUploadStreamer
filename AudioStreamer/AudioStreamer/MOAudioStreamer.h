//
//  MOAudioStreamer.h
//  Tardeed
//
//  Created by moath othman on 5/22/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//
#import <UIKit/UIKit.h>
 #import <AVFoundation/AVFoundation.h>
#import "NSData+Additions.h"

@class MOAudioStreamer;

@protocol MOAudioStreamerDeelegate <NSObject>

-(void)MOAudioStreamerDidFinishStreaming:(MOAudioStreamer*)streamer;
-(void)MOAudioStreamerDidFinishRequest:(NSURLConnection*)connectionRequest withResponse:(NSString*)response;
-(void)MOAudioStreamerDidFailed:(MOAudioStreamer*)streamer message:(NSString*)reason;

@end
 
@interface MOAudioStreamer : NSObject<AVAudioRecorderDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSString*soundFilePath;
    NSString*soundOFilePath;
    AVAudioRecorder *recorder;
 @public   BOOL StopSignal;
     
    NSMutableData *responseData;
    dispatch_queue_t _streamDispatch;

    BOOL giveMeResults;
    
    
    BOOL orderToStop;
    @public  NSError *connectionError;
    BOOL stopSendingStupidData;

    @private     NSMutableURLRequest *   request;

}
@property(assign,nonatomic)NSTimeInterval expectingTimeOut;
@property(assign)id<MOAudioStreamerDeelegate>streamerDelegate;
@property(strong,nonatomic)NSString*recordingPath;
@property(strong,nonatomic)NSString *webServiceURL;
@property(strong,nonatomic)NSString *fileToSaveName;
@property(retain,nonatomic)NSString*password;
@property(retain,nonatomic)NSString*userName;
@property (nonatomic, strong, readwrite) NSURLConnection *  connection;
@property(strong,nonatomic)AVAudioRecorder *recorder;
@property(assign)int lol;
 - (void)startStreamer;
-(void)stopStreaming;
- (void)cancelStreaming;
@end
