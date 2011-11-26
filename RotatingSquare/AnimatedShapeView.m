//
//  RotatingSquare.m
//  RotatingSquare
//
//  Created by Roger Whitney on 11/20/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "RWCGUtuls.h"
#import "AnimatedShapeView.h"



@implementation AnimatedShapeView

-(void) addSquare: (Square *) aSquare {
    if (!squares) 
        squares = [NSMutableArray new];
    [squares addObject:aSquare];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [squares makeObjectsPerformSelector:@selector(drawOn:) withObject:context];
}


-(void) rotate {
    [self setNeedsDisplay];
}

-(void) dealloc {
    
}

@end
