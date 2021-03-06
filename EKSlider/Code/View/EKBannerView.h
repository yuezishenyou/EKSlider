//
//  EKBannerView.h
//  EKSlider
//
//  Created by 杨广军 on 2018/11/6.
//  Copyright © 2018 maoziyue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EKBannerView;
@protocol EKBannerViewDelegate <NSObject>

- (void)bannerView:(EKBannerView *)bannerView btnClick:(NSInteger)index;

@end

@interface EKBannerView : UIView

@property (nonatomic, weak) id <EKBannerViewDelegate> delegate;




@end

NS_ASSUME_NONNULL_END
