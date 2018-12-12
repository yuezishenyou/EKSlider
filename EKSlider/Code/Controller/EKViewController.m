//
//  EKViewController.m
//  EKSlider
//
//  Created by 杨广军 on 2018/11/6.
//  Copyright © 2018 maoziyue. All rights reserved.
//

#import "EKViewController.h"
#import <MapKit/MapKit.h>
#import "EKScrollView.h"
#import "EKTableView.h"
#import "EKTableView2.h"


#import "EKTableViewCell.h"
#import "EKBannerView.h"
#import "EKBabyView.h"

#define kCellH 150                       //cell高度

/* 屏幕的尺寸 */
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface EKViewController ()<UITableViewDelegate,UITableViewDataSource,EKBannerViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) EKBannerView *bannerView;

@property (nonatomic, strong) EKBabyView *babyView;

@property (nonatomic, strong) EKScrollView *scrollView;

@property (nonatomic, strong) EKTableView *tbView;

@property (nonatomic, strong) EKTableView2 *tbView2;





@end

@implementation EKViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.title = @"slider UI";
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    /**
     *  大背景是 scrollView
     *
     *  这个效果的局限性,
     *  scrollView的子视图是有序且每个 scrollVie 每一页只能加一个子试图.
     */
    
    
    [self configMap];
    
    [self setupBanner];
    
    [self setupUI];    // 主要模块
    
 
    
    
}

- (void)configMap {
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
     self.mapView.mapType = MKMapTypeStandard;
    [self.view addSubview:self.mapView];
    [self.view sendSubviewToBack:self.mapView];
}

- (void)setupBanner {
    
    self.bannerView = [[EKBannerView alloc] init];
    self.bannerView.frame = CGRectMake(0, 0, kScreenW, 120);
    self.bannerView.delegate = self;
    [self.view addSubview:self.bannerView];
}


- (void)setupUI {
    
    // scrollView
    self.scrollView = [[EKScrollView alloc] init];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake(0, 0);
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    
    // tbView
    self.tbView = [[EKTableView alloc] initWithFrame:CGRectMake(0, 20, kScreenW, kScreenH-20) style:UITableViewStylePlain];
    self.tbView.backgroundColor = [UIColor clearColor];
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    self.tbView.separatorStyle = 0;
    self.tbView.contentInset = UIEdgeInsetsMake(kScreenH - kCellH - 20, 0, 0, 0);
    [self.tbView registerNib:[UINib nibWithNibName:@"EKTableViewCell" bundle:nil] forCellReuseIdentifier:@"EKTableViewCell"];
    //[self.tbView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.scrollView addSubview:self.tbView];

    

    
    
    
    self.tbView2 = [[EKTableView2 alloc] initWithFrame:CGRectMake(kScreenW + 10 , 20, kScreenW -20, kScreenH-20) style:UITableViewStylePlain];
    self.tbView2.backgroundColor = [UIColor clearColor];
    self.tbView2.delegate = self;
    self.tbView2.dataSource = self;
    self.tbView2.separatorStyle = 0;
    self.tbView2.contentInset = UIEdgeInsetsMake(kScreenH - kCellH - 20, 0, 0, 0);
    [self.tbView2 registerNib:[UINib nibWithNibName:@"EKTableViewCell" bundle:nil] forCellReuseIdentifier:@"EKTableViewCell"];
    //[self.tbView2 addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.scrollView addSubview:self.tbView2];
    
    
    // baby
    //self.babyView = [[EKBabyView alloc] initWithFrame:CGRectMake(kScreenW*2 + 10, kScreenH - 180 - 10, kScreenW - 20, kScreenH *3)];
    self.babyView = [[EKBabyView alloc] initWithFrame:CGRectMake(kScreenW*2 + 10, 200, kScreenW - 20, kScreenH *3)];
    [self.scrollView addSubview:self.babyView];
    self.babyView.backgroundColor = [UIColor greenColor];
    
}



















































#pragma mark ------------KVO 监听tableView的contentOffset属性（收缩头部视图）-------------------
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        CGPoint tableContenOffset = [change[NSKeyValueChangeNewKey] CGPointValue];
        
 

        
        


        if (tableContenOffset.y > - kScreenH * 0.5) {
            
            self.scrollView.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.8];

//            if (self.headerView.xds_y == 0) {
//                [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{ //0.15秒内做完改变frame的动画，动画效果匀速
//                    self.headerView.xds_y = -headerH;
//                } completion:nil];
//            }
        }
        if (tableContenOffset.y < -kScreenH * 0.5) {
            
            self.scrollView.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0];

//            if (self.headerView.xds_y == -headerH) {
//                [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{ //0.15秒内做完改变frame的动画，动画效果匀速
//                    self.headerView.xds_y = 0;
//                } completion:nil];
//
//            }
        }
    }
    
}













#pragma mark ----------------- tbView 代理 ---------------------------
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellH;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EKTableViewCell"];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"---%ld----",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row %2 ) {
         NSLog(@"---下去-----");
        self.tbView.contentInset = UIEdgeInsetsMake(kScreenH - 20 - kCellH, 0, 0, 0);   //下去
        [self.tbView setContentOffset:CGPointMake(0, -(kScreenH - 20 - kCellH)) animated:YES];

    }
    else {
        NSLog(@"---上去-----");
        self.tbView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);                       //上去
        [self.tbView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    
}



#pragma mark ------- bannerView 代理------------
- (void)bannerView:(EKBannerView *)bannerView btnClick:(NSInteger)index {
    
    NSLog(@"------index:%ld-----",index);
    
    [self.scrollView setContentOffset:CGPointMake(kScreenW * index, 0) animated:YES];
    
}






@end
