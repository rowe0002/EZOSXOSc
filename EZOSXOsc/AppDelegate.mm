//
//  AppDelegate.m
//  EZOSXOsc
//
//  Created by Robert Rowe on 2/3/16.
//  Copyright (c) 2016 Robert Rowe. All rights reserved.
//

#import  "AppDelegate.h"
#include "Pfx.hpp"
#include "EZOSXOsc.hpp"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
@synthesize playButton;

Pfx*      p       = nullptr;
EZOSXOsc* ezOsc   = nullptr;
bool      playing = false;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    p = new Pfx();
    if (!p)
    {
        NSLog(@"ERROR: can't get audio IO");
        exit(1);
    }
    ezOsc = new EZOSXOsc;
    p->SetScore(ezOsc);
    p->Start();
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    p->Stop();
    delete ezOsc;
    delete p;
    p = nullptr;
}

- (IBAction)buttonPush:(id)sender
{
    if (!playing)
    {
        ezOsc->osc->TurnOn();
        playing = true;
        [playButton setTitle:@"Stop Sine"];
    } else
    {
        ezOsc->osc->TurnOff();
        playing = false;
        [playButton setTitle:@"Play Sine"];
    }
}

@end
