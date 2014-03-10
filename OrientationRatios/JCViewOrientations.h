//
//  Copyright (c) 2014 JCMultimedia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JCViewOrientation)
{
    JCViewOrientationPortrait,
    JCViewOrientationLandscape
};

typedef NS_ENUM(NSInteger, JCViewAspectRatio)
{
    JCViewAspectRatioFit,
    JCViewAspectRatioFill
};

/**
 * Given a size, determine it's orientation
 */

JCViewOrientation JCViewOrientationForSize(CGSize viewSize);

CGSize JCSizeRestrainedToViewAspectRatio(CGSize size, CGSize constraint, JCViewAspectRatio aspectRatio);

CGSize JCAspectFillSize(CGSize originalSize, CGSize fillSize);

CGSize JCAspectFitSize(CGSize originalSize, CGSize fillSize);

/**  Utility Methods
 *
 */
CGSize CGSizeScale(CGSize size, CGFloat scale);

CGSize CGSizeCeil(CGSize size);