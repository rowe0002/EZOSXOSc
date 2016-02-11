//
//  EZOSXOsc.h
//  EZOSXOsc
//
//  Created by Robert Rowe on 2/4/16.
//  Copyright (c) 2016 Robert Rowe. All rights reserved.
//

#ifndef __EZOSXOsc__EZOSXOsc__
#define __EZOSXOsc__EZOSXOsc__

#include "Score.hpp"
#include "Oscillator.hpp"

class EZOSXOsc : public Score
{
public:
    Oscillator* osc;
    
public:
    EZOSXOsc(void);
   ~EZOSXOsc(void);

    void RouteAudio(double** mixChannels);
};

#endif /* defined(__EZOSXOsc__EZOSXOsc__) */
