//
//  ViewController.h
//  RotatingSquare
//
//  Created by Roger Whitney on 11/20/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Square.h"
#import "TriangleView.h"

/**
 Animation is driven by the clock. It calls the move method
 */
@interface ViewController : UIViewController {
    Square * fallingSquare;
    Square * rotatingSquare;
    NSTimer * clock;
    TriangleView * triangleView;
}

-(void) move;

@end
