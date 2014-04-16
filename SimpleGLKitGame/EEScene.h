//
//  EEScene.h
//  SimpleGLKitGame
//
//  Created by Zakk Hoyt on 4/16/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>
@import GLKit;
@interface EEScene : NSObject
@property GLKVector4 clearColor;
@property float left, right, bottom, top;
-(void)update;
-(void)render;
@end