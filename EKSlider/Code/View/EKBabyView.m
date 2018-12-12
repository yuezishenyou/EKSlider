//
//  EKBabyView.m
//  EKSlider
//
//  Created by 杨广军 on 2018/11/6.
//  Copyright © 2018 maoziyue. All rights reserved.
//

#import "EKBabyView.h"

@implementation EKBabyView

- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"EKBabyView" owner:nil options:nil]firstObject];
        
        self.frame = frame;
    }
    return self;
    
}












































@end
