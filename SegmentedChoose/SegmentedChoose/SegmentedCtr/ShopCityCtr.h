//
//  ShopCityCtr.h
//  GuoJi Bluetooth
//
//  Created by zhang on 16/10/6.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCityCtr : UIViewController

/*button显示的title数组*/
@property (nonatomic,strong)NSArray *titleArr ;

/*子控制器数组*/
@property (nonatomic,strong)NSArray *childrenContentCtr;

/*设置button默认字体的大小*/
@property (nonatomic,assign)CGFloat  btnTitleDefaultFont;

/*设置button选中字体的大小*/
@property (nonatomic,assign)CGFloat  btnTitleSelectedFont;

/*设置button默认字体的颜色*/
@property (nonatomic,strong)UIColor *btnTitleDefaultColor ;

/*设置button选中字体的颜色*/
@property (nonatomic,strong)UIColor *btnTitleSelectedColor ;

/*设置移动的红线的颜色*/
@property (nonatomic,strong)UIColor *lineViewColor ;


@end
