//
//  Copyright (c) 2014 JCMultimedia. All rights reserved.
//

#import "Kiwi.h"
#import "JCViewOrientations.h"

SPEC_BEGIN(OrientationRatioSpec)

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

describe(@"size constrained with size", ^{

    __block CGSize size;

    it(@"should keep the ratio of the original image", ^{
        size = JCSizeRestrainedToViewAspectRatio(CGSizeMake(200, 10), CGSizeMake(10, 200), JCViewAspectRatioFit);
        [[theValue(size.width) should] equal:theValue(10)];
        [[theValue(size.height) should] equal:theValue(10)];


        [[theValue(size.width / size.height) should] equal:theValue(200.f/10.f)];
    });

});

SPEC_END
