//
//  ViewController.m
//  RotatingSquare
//
//  Created by Roger Whitney on 11/20/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "ViewController.h"
#import "AnimatedShapeView.h"


@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

/**
 moves the squares and updates display
 */
-(void) move {
    [rotatingSquare rotateBy:3];
    [fallingSquare fallBy:4];
    [self.view setNeedsDisplay];
}

-(void) dealloc {
    [super dealloc];
    [triangleView removeFromSuperview];
    [triangleView release];
    [rotatingSquare release];
    [fallingSquare release];
    [clock invalidate];
    [clock release];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    rotatingSquare = [[Square alloc] initWithOrgin:CGPointMake(110, 190) size:100];
    rotatingSquare.color = [UIColor redColor];
    fallingSquare = [[Square alloc] initWithOrgin:CGPointMake(50, 0) size:70];
    fallingSquare.color = [UIColor blueColor];
    clock = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(move) userInfo:nil repeats:YES];
    [clock  retain];
    
	AnimatedShapeView * mainView =  self.view;
    [mainView addSquare:rotatingSquare];
    [mainView addSquare:fallingSquare];
    triangleView = [[TriangleView alloc] initWithFrame:CGRectMake(200, 20, 100, 100)];
    triangleView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [self.view addSubview:triangleView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [triangleView removeFromSuperview];
    [triangleView release];
    triangleView = nil;
    [rotatingSquare release];
    rotatingSquare = nil;
    [fallingSquare release];
    fallingSquare = nil; 
    [clock invalidate];
    [clock release];
    clock = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
