//
//  Square.m
//  RotatingSquare
//
//  Created by Roger Whitney on 11/21/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "Square.h"

@interface Square () 
- (float) degreesToRadians: (float) degrees;
@end

@implementation Square 

@synthesize color;

-(id) initWithOrgin: (CGPoint) upperLeftCorner size: (float) width {
    self = [super init];
    if (self) {
        origin = upperLeftCorner;
        size = width;
        degreesRotated = 0;
    }
    return self;
}

-(CGPoint) center {
    return CGPointMake(origin.x + size/2, origin.y + size/2);
}

-(void) fallBy: (float) deltaY {
    if (origin.y + deltaY + size < 460)
        origin = CGPointMake(origin.x, origin.y + deltaY);
}

-(CGRect) rectWithCenterAtAxisOrigin {
    return CGRectMake(-size/2, -size/2, size, size);
}

-(void) rotateBy: (float) degreesToRotateBy {
    degreesRotated += degreesToRotateBy;
}

-(void)drawOn: (CGContextRef) context {
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [self.color CGColor]);
    CGPoint newOrigin = [self center];
    CGContextTranslateCTM(context, newOrigin.x , newOrigin.y);
    CGRect centeredRect = [self rectWithCenterAtAxisOrigin];
    CGContextRotateCTM(context, [self degreesToRadians:degreesRotated] );
    CGContextFillRect (context, centeredRect);
    CGContextRestoreGState(context);
}

- (float) degreesToRadians: (float) degrees {
    return degrees * M_PI/180;
}

@end
