//
//  Copyright (c) 2014 JCMultimedia. All rights reserved.
//

#import "JCViewOrientations.h"
#import <tgmath.h>

JCViewOrientation JCViewOrientationForSize(CGSize viewSize)
{
    CGFloat sizeToWidthRatio = viewSize.width / viewSize.height;

    if (sizeToWidthRatio < (CGFLOAT_TYPE)1)
    {
        return JCViewOrientationPortrait;
    }
    return JCViewOrientationLandscape;
};

CGSize JCSizeRestrainedToViewAspectRatio(CGSize size, CGSize constraint, JCViewAspectRatio aspectRatio)
{
    if (aspectRatio == JCViewAspectRatioFill)
    {
        return JCAspectFillSize(size, constraint);
    }
    else
    {
        return JCAspectFitSize(size, constraint);
    }
}

CGSize JCAspectFillSize(CGSize originalSize, CGSize fillSize)
{
    const CGFloat widthRatio = fillSize.width / originalSize.width;
    const CGFloat heightRatio = fillSize.height / originalSize.height;
    const CGFloat scale = MAX(widthRatio, heightRatio);

    return CGSizeCeil(CGSizeScale(originalSize, scale));
}

CGSize JCAspectFitSize(CGSize originalSize, CGSize fillSize)
{
    const CGFloat fillAspect = fillSize.width / fillSize.height;
    const CGFloat originalAspect = originalSize.width / originalSize.height;
    CGSize resultSize = fillSize;

    if (fillAspect > originalAspect)
    {
        resultSize.width = fillSize.height * originalAspect;
    }
    else
    {
        resultSize.height = fillSize.width / originalAspect;
    }

    return CGSizeCeil(resultSize);
}

CGSize CGSizeScale(CGSize size, CGFloat scale)
{
    size.height *= scale;
    size.width *= scale;
    return size;
}

CGSize CGSizeCeil(CGSize size)
{
    return CGSizeMake(ceil(size.width), ceil(size.height));
}
