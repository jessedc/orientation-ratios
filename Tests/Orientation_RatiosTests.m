//
//  Copyright (c) 2014 JCMultimedia. All rights reserved.
//

#import "Kiwi.h"
#import "JCViewOrientations.h"

SPEC_BEGIN(Test)

describe(@"View Orientation For Size", ^{

    it(@"width larger than height should be landscape", ^{
        [[@(JCViewOrientationForSize(CGSizeMake(100,50))) should] equal:@(JCViewOrientationLandscape)];
    });

    it(@"height larger than width should be portrait", ^{
        [[theValue(JCViewOrientationForSize(CGSizeMake(50,100))) should] equal:theValue(JCViewOrientationPortrait)];
    });

    it(@"height is equal to the width should be classified as landscape", ^{
        [[theValue(JCViewOrientationForSize(CGSizeMake(50, 50))) should] equal:theValue(JCViewOrientationLandscape)];
    });

});

SPEC_END
