//
//  Copyright (c) 2014 JCMultimedia. All rights reserved.
//

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

    __block CGSize originalSize;
    __block CGSize constrainedSize;
    __block CGSize derrivedSize;

    beforeEach(^{
        originalSize = CGSizeMake(20, 10);
        constrainedSize = CGSizeMake(10, 20);
    });

    context(@"Aspect ratio fit", ^{
        beforeEach(^{
            derrivedSize = JCSizeRestrainedToViewAspectRatio(originalSize, constrainedSize, JCViewAspectRatioFit);
        });

        it(@"should keep the ratio of the original image", ^{
            [[theValue(derrivedSize.width / derrivedSize.height) should] equal:theValue(originalSize.width / originalSize.height)];
        });

        it(@"should constrain the width", ^{
            [[theValue(derrivedSize.width) should] equal:theValue(10)];
            [[theValue(derrivedSize.height) should] equal:theValue(5)];
        });
    });

    context(@"Aspect ratio fill", ^{
        beforeEach(^{
            derrivedSize = JCSizeRestrainedToViewAspectRatio(originalSize, constrainedSize, JCViewAspectRatioFill);
        });

        it(@"should keep the ratio of the original image", ^{
            [[theValue(derrivedSize.width / derrivedSize.height) should] equal:theValue(originalSize.width / originalSize.height)];
        });

        it(@"should scale up the height and the width", ^{
            [[theValue(derrivedSize.width) should] equal:theValue(40)];
            [[theValue(derrivedSize.height) should] equal:theValue(20)];
        });
    });


});

SPEC_END
