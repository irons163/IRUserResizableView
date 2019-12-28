//
//  IRUserResizableView.h
//  IRUserResizableView
//
//  Created by irons on 2019/12/15.
//  Copyright © 2019年 irons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//! Project version number for IRUserResizableView.
FOUNDATION_EXPORT double IRUserResizableViewVersionNumber;

//! Project version string for IRUserResizableView.
FOUNDATION_EXPORT const unsigned char IRUserResizableViewVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <IRUserResizableView/PublicHeader.h>

typedef struct IRUserResizableViewAnchorPoint {
    CGFloat adjustsX;
    CGFloat adjustsY;
    CGFloat adjustsH;
    CGFloat adjustsW;
} IRUserResizableViewAnchorPoint;

@protocol IRUserResizableViewDelegate;
@class SPGripViewBorderView;

@interface IRUserResizableView : UIView {
    SPGripViewBorderView *borderView;
    CGPoint touchStart;
    
    // Used to determine which components of the bounds we'll be modifying, based upon where the user's touch started.
    IRUserResizableViewAnchorPoint anchorPoint;
}

@property (nonatomic, weak) id <IRUserResizableViewDelegate> delegate;

// Will be retained as a subview.
@property (nonatomic, weak) UIView *contentView;

// Default is 48.0 for each.
@property (nonatomic) CGFloat minWidth;
@property (nonatomic) CGFloat minHeight;

// Defaults to YES. Disables the user from dragging the view outside the parent view's bounds.
@property (nonatomic) BOOL preventsPositionOutsideSuperview;

- (void)hideEditingHandles;
- (void)showEditingHandles;

@end

@protocol IRUserResizableViewDelegate <NSObject>

@optional

// Called when the resizable view receives touchesBegan: and activates the editing handles.
- (void)userResizableViewDidBeginEditing:(IRUserResizableView *)userResizableView;

// Called when the resizable view receives touchesEnded: or touchesCancelled:
- (void)userResizableViewDidEndEditing:(IRUserResizableView *)userResizableView;

@end
