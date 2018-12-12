//
//  EKBannerView.m
//  EKSlider
//
//  Created by 杨广军 on 2018/11/6.
//  Copyright © 2018 maoziyue. All rights reserved.
//

#import "EKBannerView.h"

@interface EKBannerView ()

@property (weak, nonatomic) IBOutlet UIButton *btn0;

@property (weak, nonatomic) IBOutlet UIButton *btn1;

@property (weak, nonatomic) IBOutlet UIButton *btn2;


@end


@implementation EKBannerView

- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"EKBannerView" owner:nil options:nil]firstObject];
        
        self.frame = frame;
        
    }
    return self;
}


- (IBAction)btnClick:(id)sender {
    
   
    NSInteger index = 0;
    if (sender == _btn0) {
        index = 0;
    }
    else if (sender == _btn1) {
        index = 1;
    }
    else {
        index = 2;
    }
    
    if ([self.delegate respondsToSelector:@selector(bannerView:btnClick:)]) {
        [self.delegate bannerView:self btnClick:index];
    }
   
    
}












































@end
