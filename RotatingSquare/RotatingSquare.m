//
//  RotatingSquare.m
//  RotatingSquare
//
//  Created by Roger Whitney on 11/20/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "RWCGUtuls.h"
#import "RotatingSquare.h"


@interface RotatingSquare () 

-(void) rotateSquare: (CGRect) aSquare on: (CGContextRef) context by: (CGFloat) degrees;
-(void) rotate;
@end
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

- (void)initSquareAndTimer
{
    largeSquare = CGRectMake(110, 190, 100, 100);
    smallSquare = CGRectMake(50, 80, 70, 70);
    rotater = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(rotate) userInfo:nil repeats:YES];
    [rotater retain];
}

- (void)drawRect:(CGRect)rect
{
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
