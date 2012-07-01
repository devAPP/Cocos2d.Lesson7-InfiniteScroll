//
//  HelloWorldLayer.m
//  InfiniteScrollExample
//
//  Created by Ignazio Calò on 7/1/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init])) {
        CGSize screensize = [[CCDirector sharedDirector] winSize];
        numSprite = 4;
        
        CCSprite *sprite0 = [CCSprite spriteWithFile:@"liv_0.png"];
        [sprite0 setAnchorPoint:CGPointMake(0,0)];
        [sprite0 setPosition:CGPointMake(0,0)];
        [self addChild:sprite0];
        
        CCSprite *sprite0b = [CCSprite spriteWithFile:@"liv_0.png"];
        [sprite0b setAnchorPoint:CGPointMake(0,0)];
        [sprite0b setPosition:CGPointMake(screensize.width - 1, 0)];
        [self addChild:sprite0b];
        
        
        
        CCSprite *sprite1 = [CCSprite spriteWithFile:@"liv_1.png"];
        [sprite1 setAnchorPoint:CGPointMake(0,0)];
        [sprite1 setPosition:CGPointMake(0,80)];
        [self addChild:sprite1];
        
        CCSprite *sprite1b = [CCSprite spriteWithFile:@"liv_1.png"];
        [sprite1b setAnchorPoint:CGPointMake(0,0 )];
        [sprite1b setPosition:CGPointMake(screensize.width - 1 , 80)];
        sprite1b.flipX = YES;
        [self addChild:sprite1b];
        
        CCSprite *sprite2 = [CCSprite spriteWithFile:@"liv_2.png"];
        [sprite2 setAnchorPoint:CGPointMake(0, 0)];
        [sprite2 setPosition:CGPointMake(0, 60)];
        [self addChild:sprite2];
        
        CCSprite *sprite2b = [CCSprite spriteWithFile:@"liv_2.png"];
        [sprite2b setAnchorPoint:CGPointMake(0, 0)];
        [sprite2b setPosition:CGPointMake(screensize.width -1 , 60)];
        sprite2b.flipX = YES;
        [self addChild:sprite2b];
        
        
        
        CCSprite *sprite3 = [CCSprite spriteWithFile:@"liv_3.png"];
        [sprite3 setAnchorPoint:CGPointMake(0, 0)];
        [sprite3 setPosition:CGPointMake(0, 0)];
        [self addChild:sprite3];
        
        CCSprite *sprite3b = [CCSprite spriteWithFile:@"liv_3.png"];
        [sprite3b setAnchorPoint:CGPointMake(0, 0)];
        [sprite3b setPosition:CGPointMake(screensize.width - 1, 0)];
        sprite3.flipX = YES;
        [self addChild:sprite3b];
                
        spriteArray = [[NSArray arrayWithObjects:sprite0,sprite1, sprite2, sprite3, sprite0b,sprite1b, sprite2b, sprite3b, nil ] retain];
        
        speedFactors = [[NSArray arrayWithObjects:
                         [NSNumber numberWithFloat:0.1],
                         [NSNumber numberWithFloat:0.4],
                         [NSNumber numberWithFloat:0.8],
                         [NSNumber numberWithFloat:1.0],
                         
                         [NSNumber numberWithFloat:0.1],
                         [NSNumber numberWithFloat:0.4],
                         [NSNumber numberWithFloat:0.8],
                         [NSNumber numberWithFloat:1.0],
                         nil] retain];
        
        [self scheduleUpdate];
        
        
    }
	return self;
}



-(void)update:(ccTime)delta {
    CGSize screensize = [[CCDirector sharedDirector] winSize];
    
    for (CCSprite *sprite in spriteArray) {
        int index = [spriteArray indexOfObject:sprite];
        
        CGPoint position = sprite.position;
        position.x -= 100 * (delta) * [[speedFactors objectAtIndex:index]floatValue];

        
        if ( position.x < -screensize.width ) {
            position.x += ( sprite.contentSize.width * 2 ) - 2;
        }
        sprite.position = position;
    }
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
