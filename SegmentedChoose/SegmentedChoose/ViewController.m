//
//  ViewController.m
//  SegmentedChoose
//
//  Created by zhang on 16/10/26.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "ViewController.h"
#import "ShopCityCtr.h"
#import "OneCtr.h"
#import "TwoCtr.h"
#import "Three.h"
#import "FourCtr.h"
#import "FiveCtr.h"

@interface ViewController ()

@end

@implementation ViewController



//demo 
- (IBAction)showSegment:(id)sender {
    
    ShopCityCtr *vc = [ShopCityCtr new];
    
    //title
    vc.titleArr = @[@"11111",@"2222",@"333",@"44",@"5"];
    
    //子控制器
    OneCtr *one =[OneCtr new];
    TwoCtr *two = [TwoCtr new];
    Three  *three = [Three new];
    FourCtr *four = [FourCtr new];
    FiveCtr *five = [FiveCtr new];
    
    //title 的颜色和字体大小
    vc.btnTitleDefaultFont = 12;
    vc.btnTitleSelectedFont = 22;
    vc.btnTitleDefaultColor = [UIColor whiteColor];
    vc.btnTitleSelectedColor = [UIColor redColor];
    vc.lineViewColor = [UIColor redColor];
    
    vc.childrenContentCtr = @[one,two,three,four,five];
    
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
