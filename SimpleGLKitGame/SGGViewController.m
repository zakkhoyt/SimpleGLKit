//
//  SGGViewController.m
//  SimpleGLKitGame
//
//  Created by Zakk Hoyt on 4/16/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "SGGViewController.h"
#import "EEScene.h"



@interface SGGViewController ()
@property (strong, nonatomic) EAGLContext *context;
@property (nonatomic, strong) EEScene *scene;
@end

@implementation SGGViewController
@synthesize context = _context;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    [EAGLContext setCurrentContext:self.context];
    
    self.scene = [[EEScene alloc]init];
    self.scene.clearColor = GLKVector4Make(0.1, 0.9, 0.9, 0.0);
    [self updateSceneBounds:[self interfaceOrientation]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    NSLog(@"%s: bounds: %@", __PRETTY_FUNCTION__, NSStringFromCGRect(self.view.bounds));
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self updateSceneBounds:toInterfaceOrientation];
    NSLog(@"%s: bounds: %@", __PRETTY_FUNCTION__, NSStringFromCGRect(self.view.bounds));
}


-(void)updateSceneBounds:(UIInterfaceOrientation)toInterfaceOrientation{

    if(toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        // Moving to portrait
        float x = 1.0;
        float y = self.view.bounds.size.width / (float)self.view.bounds.size.height;
        self.scene.left   = -x;
        self.scene.right  =  x;
        self.scene.bottom = -y;
        self.scene.top    =  y;
        NSLog(@"x: %f y: %f", x, y);
        
    } else {
        float x = self.view.bounds.size.height / (float)self.view.bounds.size.width;
        float y = 1.0;
        self.scene.left   = -x;
        self.scene.right  =  x;
        self.scene.bottom = -y;
        self.scene.top    =  y;
        NSLog(@"x: %f y: %f", x, y);
    }

}

#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    
    [self.scene render];
}

- (void)update {
    
    [self.scene update];
}

@end