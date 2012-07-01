//
//  HelloWorldLayer.h
//  InfiniteScrollExample
//
//  Created by Ignazio Calò on 7/1/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    NSArray *spriteArray;
    int numSprite;
    NSArray *speedFactors;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
