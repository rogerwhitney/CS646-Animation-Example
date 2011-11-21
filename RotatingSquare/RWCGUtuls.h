//
//  RWCGUtuls.h
//  RotatingSquare
//
//  Created by Roger Whitney on 11/21/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#ifndef RotatingSquare_RWCGUtuls_h
#define RotatingSquare_RWCGUtuls_h

float degreesToRadians(float degrees);
CGRect rectMake(CGFloat x, CGFloat y,CGSize size);
CGPoint rectCenter(CGRect aRectangle);
CGRect shiftRectCenterToOrigin( CGRect aRectangle);

float degreesToRadians(float degrees) {
    return degrees * M_PI/180;
}

CGRect rectMake(CGFloat x, CGFloat y,CGSize size) {
    return CGRectMake(x, y, size.width, size.height);
}

CGPoint rectCenter(CGRect aRectangle) {
    CGPoint origin = aRectangle.origin;
    CGSize size  = aRectangle.size;
    return CGPointMake(origin.x + size.width/2, origin.y + size.height/2);
}

CGRect shiftRectCenterToOrigin( CGRect aRectangle) {
    return rectMake(-aRectangle.size.width/2,-aRectangle.size.height/2,aRectangle.size);
}



#endif
