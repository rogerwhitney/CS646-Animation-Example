//
//  Square.h
//  RotatingSquare
//
//  Created by Roger Whitney on 11/21/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Maintains properties of sqaure that cane be displayed, rotated and moves down
 Would be better if square had a velocity and was connected to the clock directly. Problem with this example is that the model is not well defined.
 */
@interface Square : NSObject {
    CGPoint origin;
    float size;
    float   degreesRotated;
}

@property (retain) UIColor * color;

-(id) initWithOrgin: (CGPoint) upperLeftCorner size: (float) width;

-(CGPoint) center;
-(CGRect) rectWithCenterAtAxisOrigin;
-(void) rotateBy: (float) degreesToRotateBy;
-(void)drawOn: (CGContextRef) context;
-(void) fallBy: (float) deltaY;

@end
