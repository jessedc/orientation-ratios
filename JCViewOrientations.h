//
//  Copyright (c) 2014 JCMultimedia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JCViewOrientation)
{
    JCViewOrientationPortrait,
    JCViewOrientationLandscape //,
//    JCViewOrientationSquare
};

// JCViewAspectRatioFit / UIViewContentModeScaleAspectFit
// The option to scale the content to fit the size of the view by maintaining the aspect ratio.
// Any remaining area of the view’s bounds is transparent.

// JCViewAspectRatioFill / UIViewContentModeScaleAspectFill
// The option to scale the content to fill the size of the view. Some portion of the content
// may be clipped to fill the view’s bounds.

typedef NS_ENUM(NSInteger, JCViewAspectRatio)
{
    JCViewAspectRatioFit, // UIViewContentModeScaleAspectFit,
    JCViewAspectRatioFill // UIViewContentModeScaleAspectFill
};

/** Returns JCViewOrientation for a size
 *
 */

JCViewOrientation JCViewOrientationForSize(CGSize viewSize);

/** Returns the constrained size
 *
 */
CGSize JCSizeRestrainedToViewAspectRatio(CGSize size, CGSize constraint, JCViewAspectRatio aspectRatio);
