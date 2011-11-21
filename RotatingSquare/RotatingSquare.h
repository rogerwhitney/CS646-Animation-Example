//
//  RotatingSquare.h
//  RotatingSquare
//
//  Created by Roger Whitney on 11/20/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotatingSquare : UIView {
    CGRect largeSquare;
    CGRect smallSquare;
    int degreesToRotate;
    NSTimer * rotater;
}

-(void)initSquareAndTimer;

@end
