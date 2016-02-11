//
//  EZOSXOsc.cpp
//  EZOSXOsc
//
//  Created by Robert Rowe on 2/4/16.
//  Copyright (c) 2016 Robert Rowe. All rights reserved.
//

#include "EZOSXOsc.hpp"

EZOSXOsc::EZOSXOsc(void)
{
    osc = new Oscillator;
    AddUG(osc);
}

EZOSXOsc::~EZOSXOsc(void)
{
    delete osc;
}

void EZOSXOsc::RouteAudio(double** mixChannels)
{
    for (int i=0; i<ugIndex; i++)
        ugs[i]->Update();
    
    osc->GetOutputSamples(mixChannels, 2);
}
