//
//  Copyright (c) 2014 JCMultimedia. All rights reserved.
//

#import "JCViewOrientations.h"

JCViewOrientation JCViewOrientationForSize(CGSize viewSize)
{
    CGFloat sizeToWidthRatio = viewSize.width / viewSize.height;

    if (sizeToWidthRatio < (CGFLOAT_TYPE)1)
    {
        return JCViewOrientationPortrait;
    }
    return JCViewOrientationLandscape;
};
