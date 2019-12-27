//
//  ViewController.m
//  demo
//
//  Created by irons on 2019/12/15.
//  Copyright © 2019年 irons. All rights reserved.
//

#import "ViewController.h"
#import <IRUserResizableView/IRUserResizableView.h>

@interface ViewController ()<UIGestureRecognizerDelegate, IRUserResizableViewDelegate> {
    IRUserResizableView *currentlyEditingView;
    IRUserResizableView *lastEditedView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    self.view = [[UIView alloc] initWithFrame:appFrame];
    self.view.backgroundColor = [UIColor greenColor];
    
    // (1) Create a user resizable view with a simple red background content view.
    CGRect gripFrame = CGRectMake(50, 50, 200, 150);
    IRUserResizableView *userResizableView = [[IRUserResizableView alloc] initWithFrame:gripFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:gripFrame];
    [contentView setBackgroundColor:[UIColor redColor]];
    userResizableView.contentView = contentView;
    userResizableView.delegate = self;
    [userResizableView showEditingHandles];
    currentlyEditingView = userResizableView;
    lastEditedView = userResizableView;
    [self.view addSubview:userResizableView];
    
    // (2) Create a second resizable view with a UIImageView as the content.
    CGRect imageFrame = CGRectMake(50, 200, 200, 200);
    IRUserResizableView *imageResizableView = [[IRUserResizableView alloc] initWithFrame:imageFrame];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"milky_way.jpg"]];
    imageResizableView.contentView = imageView;
    imageResizableView.delegate = self;
    [self.view addSubview:imageResizableView];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideEditingHandles)];
    [gestureRecognizer setDelegate:self];
    [self.view addGestureRecognizer:gestureRecognizer];
}

- (void)userResizableViewDidBeginEditing:(IRUserResizableView *)userResizableView {
    [currentlyEditingView hideEditingHandles];
    currentlyEditingView = userResizableView;
}

- (void)userResizableViewDidEndEditing:(IRUserResizableView *)userResizableView {
    lastEditedView = userResizableView;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([currentlyEditingView hitTest:[touch locationInView:currentlyEditingView] withEvent:nil]) {
        return NO;
    }
    return YES;
}

- (void)hideEditingHandles {
    // We only want the gesture recognizer to end the editing session on the last
    // edited view. We wouldn't want to dismiss an editing session in progress.
    [lastEditedView hideEditingHandles];
}

@end
