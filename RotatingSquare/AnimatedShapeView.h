//
//  RotatingSquare.h
//  RotatingSquare
//
//  Created by Roger Whitney on 11/20/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Square.h"

@interface AnimatedShapeView : UIView {
    NSMutableArray * squares;
}

-(void) addSquare: (Square *) aSquare;

@end
