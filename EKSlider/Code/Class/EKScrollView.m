//
//  EKScrollView.m
//  EKSlider
//
//  Created by 杨广军 on 2018/11/6.
//  Copyright © 2018 maoziyue. All rights reserved.
//

#import "EKScrollView.h"
#import "EKTableView.h"
#import "EKBabyView.h"
#import "EKTableView2.h"


@implementation EKScrollView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    int index = self.contentOffset.x / [[UIScreen mainScreen]bounds].size.width;
    if (index < self.subviews.count) {
        UIView *view = self.subviews[index];
        CGPoint viewpoint = [self convertPoint:point toView:view];
        if (viewpoint.y < 0) {
            return nil;
        }
    }
    return [super hitTest:point withEvent:event];

}

@end
