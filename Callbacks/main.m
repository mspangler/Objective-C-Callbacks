//
//  main.m
//  Callbacks
//
//  Created by Mark on 5/19/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        BNRLogger *logger = [[BNRLogger alloc] init];

        // demonstrate the Notification callback
        // get notified anytime the time zone changes on the computer
        [[NSNotificationCenter defaultCenter]
                                    addObserver:logger
                                       selector:@selector(zoneChange:)
                                           name:NSSystemTimeZoneDidChangeNotification
                                         object:nil];

        // demonstrate the Helper object callback
        // retreives the data asynchronously
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        __unused NSURLConnection *fetchConn =
            [[NSURLConnection alloc] initWithRequest:request
                                            delegate:logger
                                    startImmediately:YES];

        // demonstrate the Target-Action callback
        // makes use of a timer
        __unused NSTimer *timer =
            [NSTimer scheduledTimerWithTimeInterval:2.0
                                        target:logger
                                        selector:@selector(updateLastTime:)
                                        userInfo:nil
                                        repeats:YES];

        [[NSRunLoop currentRunLoop] run];

    }
    return 0;
}
