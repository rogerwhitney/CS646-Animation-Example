//
//  RotatingSquareTests.m
//  RotatingSquareTests
//
//  Created by Roger Whitney on 11/20/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "RotatingSquareTests.h"
#import "Square.h"

@implementation RotatingSquareTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testCenterSquare
{
    Square * ten = [[Square alloc] initWithOrgin:CGPointMake(10,0) size:100];
     CGPoint  center = [ten center];
    CGPoint expected = CGPointMake(60, 50);
    STAssertTrue(expected.x == center.x, @"");
    STAssertTrue(expected.y == center.y, @"");
}

@end
