//
//  EEScene.m
//  SimpleGLKitGame
//
//  Created by Zakk Hoyt on 4/16/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//
// EEScene.m
#import "EEScene.h"
#import <GLKit/GLKit.h>

@interface EEScene () {
    GLKVector4 clearColor;
    GLKBaseEffect *effect;
    float left, right, bottom, top;
}
@end

@implementation EEScene
@synthesize clearColor;
@synthesize left, right, bottom, top;

-(id)init{
    self = [super init];
    if(self){
    }
    return self;
}

-(void)update {
    //  NSLog(@"in EEScene's update");
}

-(void)render {
    glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    float vertices[] = {-1, -1,
        1, -1,
        0,  1};
    
//    float vertices[] = {-0.5, -0.5,
//        0.5, -0.5,
//        0,  0.5};
    
    
    // TODO: move this out to the init method and add accessors
    effect = [[GLKBaseEffect alloc] init];
    effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
    [effect prepareToDraw];
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, vertices);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    glDisableVertexAttribArray(GLKVertexAttribPosition);


}

@end