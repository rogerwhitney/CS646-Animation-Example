//
//  Triangle.m
//  RotatingSquare
//
//  Created by Roger Whitney on 11/21/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor (context, 0, 1, 0, 1);
    //CGContextRotateCTM(context, 0.2);

    CGContextBeginPath(context);
    CGContextMoveToPoint(context,0,0);
    CGContextAddLineToPoint(context, 0, 50);
    CGContextAddLineToPoint(context, 50, 50);
    CGContextFillPath(context);
}
@end
