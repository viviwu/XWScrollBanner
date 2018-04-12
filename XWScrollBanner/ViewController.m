//
//  ViewController.m
//  XWScrollBanner
//
//  Created by vivi wu on 2014/11/4.
//  Copyright © 2018年 vivi wu. All rights reserved.
//

#import "ViewController.h"
#import "XWScrollBanner.h"

@interface ViewController ()
{
    XWScrollBanner * scroll;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * arr = @[@"banner_0", @"banner_1", @"banner_2"];
    NSMutableArray * sources = [NSMutableArray array];
    for (int i=0; i<arr.count; i++) {
        XWBannerModel *model = [[XWBannerModel alloc]init];
        model.imgName =arr[i];
        [sources addObject:model];
    }
    
     scroll =[[XWScrollBanner alloc]initWithFrame:CGRectMake(0, 88.0, self.view.frame.size.width, 200.0) dataSource:sources];
    [self.view addSubview:scroll];
    scroll.dataSource = sources;
    scroll.bannerClickHandle = ^(NSInteger currentPage, XWBannerModel * model){
      NSLog(@"currentPage is: %ld", currentPage);
    };
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [scroll startTimer];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [scroll stopTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
