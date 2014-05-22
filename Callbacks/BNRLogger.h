//
//  BNRLogger.h
//  Callbacks
//
//  Created by Mark on 5/19/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRLogger : NSObject
    <NSURLConnectionDataDelegate, NSURLConnectionDataDelegate>

{
    NSMutableData *incomingData;
}

@property (nonatomic) NSDate *lastTime;
- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;
- (void)zoneChange:(NSNotification *)note;

@end
