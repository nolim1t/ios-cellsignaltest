//
//  ViewController.m
//  SignalTest
//
//  Created by Barry Teoh on 2014/1/14.
//  Copyright (c) 2014 Barry Teoh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lblSignalStatus;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self checkSignal];
}

-(void) checkSignal {
    NSString * CTSIMSupportGetSIMStatus();
    int CTGetSignalStrength();

    NSString *status = CTSIMSupportGetSIMStatus();
    int signalstrength = CTGetSignalStrength();
    BOOL connected = ( [status isEqualToString: @"kCTSIMSupportSIMStatusReady"] && signalstrength > 0 );
    if (connected) {
        NSLog(@"There is signal. The value is %d", signalstrength);
        lblSignalStatus.text = [NSString stringWithFormat:@"Signal Detected (%d)", signalstrength];
    } else {
        NSLog(@"NO connection");
        lblSignalStatus.text = @"No network";
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
