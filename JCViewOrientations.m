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

CGSize JCSizeRestrainedToViewAspectRatio(CGSize size, CGSize constraint, JCViewAspectRatio aspectRatio)
{
    CGFloat widthRatio = constraint.width / size.width;
    CGFloat heightRatio = constraint.height / size.height;

    CGFloat heightToFit = ceil(size.height * widthRatio);
    CGFloat widthToFit = ceil(size.width * heightRatio);

    if (aspectRatio == JCViewAspectRatioFill)
    {
        if (widthRatio > heightRatio)
        {
            size = CGSizeMake(constraint.width, heightToFit);
        }
        else
        {
            size = CGSizeMake(widthToFit, constraint.height);
        }
    }
    else if (aspectRatio == JCViewAspectRatioFit)
    {
        if (widthRatio < heightRatio)
        {
            size = CGSizeMake(constraint.width, heightToFit);
        }
        else
        {
            size = CGSizeMake(widthToFit, constraint.height);
        }
    }

    return size;
}