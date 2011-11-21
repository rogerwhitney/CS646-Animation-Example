//
//  RotatingSquare.m
//  RotatingSquare
//
//  Created by Roger Whitney on 11/20/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "RotatingSquare.h"

float degreesToRadians(float degrees);
float degreesToRadians(float degrees) {
    return degrees * M_PI/180;
}


CGRect rectMake(CGFloat x, CGFloat y,CGSize size);
CGRect rectMake(CGFloat x, CGFloat y,CGSize size) {
    return CGRectMake(x, y, size.width, size.height);
}


CGPoint rectCenter(CGRect aRectangle);
CGPoint rectCenter(CGRect aRectangle) {
    CGPoint origin = aRectangle.origin;
    CGSize size  = aRectangle.size;
    return CGPointMake(origin.x + size.width/2, origin.y + size.height/2);
}
CGRect shiftRectCenterToOrigin( CGRect aRectangle);
CGRect shiftRectCenterToOrigin( CGRect aRectangle) {
    return rectMake(-aRectangle.size.width/2,-aRectangle.size.height/2,aRectangle.size);
}

@implementation RotatingSquare

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        largeSquare = CGRectMake(100, 180, 120, 120);
    }
    return self;
}

-(void) rotateSquare: (CGRect) aSquare on: (CGContextRef) context by: (CGFloat) degrees {
    CGContextSaveGState(context);
    CGPoint newOrigin = rectCenter(aSquare);
    CGContextTranslateCTM(context, newOrigin.x , newOrigin.y);
    CGRect test = shiftRectCenterToOrigin(aSquare);
    CGContextRotateCTM(context, degreesToRadians(degrees));
    CGContextFillRect (context, test);
    CGContextRestoreGState(context);
}

- (void)drawRect:(CGRect)rect
{
    if (!rotater) {
        largeSquare = CGRectMake(110, 190, 100, 100);
        smallSquare = CGRectMake(50, 80, 70, 70);
        rotater = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(rotate) userInfo:nil repeats:YES];
        [rotater retain];
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor (context, 1, 0, 0, 1);
    [self rotateSquare:largeSquare on:context by:degreesToRotate];
    [self rotateSquare:smallSquare on:context by:degreesToRotate*-1];
}


-(void) rotate {
    degreesToRotate += 5;
    [self setNeedsDisplay];
}


@end
