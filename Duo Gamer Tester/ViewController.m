//
//  ViewController.m
//  Duo Gamer Tester
//
//  Created by Yifei Zhou on 4/23/17.
//  Copyright © 2017 Evian Zhow. All rights reserved.
//

#import "ViewController.h"
#import "DuoGamerSDK.h"

#ifdef DEBUG
#define DLog(fmt, ...)  { self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:fmt @"\n", ##__VA_ARGS__]]; }
#else
#define DLog NSLog
#endif

@interface ViewController () <DuoGamerDelegate>

@property (strong, nonatomic) DuoGamer *duoGamer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DuoGamer *duoGamer = [[DuoGamer alloc] init];
    duoGamer.delegate = self;
    self.duoGamer = duoGamer;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.textView.text = @"";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - DuoGamerDelegate

- (void)connected {
    DLog(@"DuoGamerTest: connected");
}

- (void)disconnected {
    DLog(@"DuoGamerTest: disconnected");
}

- (void)handleState:(DuoGamerState *)state {
    DLog(@"DuoGamerTest: DPad L%u R%u U%u D%u, Buttons A%u B%u X%u Y%u, AnalogLeft %d/%d AnalogRight %d/%d",
          state->dpadLeft, state->dpadRight, state->dpadUp, state->dpadDown,
          state->buttonA, state->buttonB, state->buttonX, state->buttonY,
          state->analogLeftX, state->analogLeftY, state->analogRightX, state->analogRightY);
}

@end
