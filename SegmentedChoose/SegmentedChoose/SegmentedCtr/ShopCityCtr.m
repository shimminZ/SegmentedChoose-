//
//  ShopCityCtr.m
//  GuoJi Bluetooth
//
//  Created by zhang on 16/10/6.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "ShopCityCtr.h"
#import "UIView+Util.h"
//#import "CarLooksCtr.h"
//#import "CarMusicAndMoviesCtr.h"
//#import "CarDecorationCtr.h"
//#import "CarSerivesCtr.h"

#define MainScreen_size_width  [UIScreen mainScreen].bounds.size.width
#define MainScreen_size_height [UIScreen mainScreen].bounds.size.height

@interface ShopCityCtr ()<UIScrollViewDelegate>

/*存放line 和 button 的view*/
@property (weak, nonatomic) IBOutlet UIView *typeContentView;

/*存放button的view*/
@property (weak, nonatomic) IBOutlet UIView *titleContentV;

// line
@property (nonatomic,strong)UIView *lineV ;

/*滑动试图*/
@property (nonatomic,strong)UIScrollView *scrollV ;

@property (nonatomic,strong)UIViewController *showIngVc ;

@property (nonatomic,strong)UIButton *goalBtn ;


@end

@implementation ShopCityCtr

-(UIView *)lineV{
    if (_lineV == nil) {
        
        _lineV = [[UIView alloc]init];
    }
    return _lineV;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //set scrollView和子控制器
    [self setUpScrollVAndChildVc];

    
    //set titleBtn和移动的line
    [self setTitleBtnAndLine];
    
    
    //默认第一个按钮显示
    [self scrollViewDidScroll:self.scrollV];

}


//set titleBtn和移动的line
-(void)setTitleBtnAndLine{
    
    CGFloat space = 10;
    CGFloat W = (MainScreen_size_width-(self.titleArr.count+1)*space)/self.titleArr.count;
    CGFloat H = 42;

    for (int i = 0; i<self.titleArr.count; i++) {
        
        //titleBtn
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:self.btnTitleDefaultColor forState:UIControlStateNormal];
        btn.frame = CGRectMake(space +(space+W)*i, 0, W, H);
        [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:self.btnTitleDefaultFont];
        [self.titleContentV addSubview:btn];
        
        //lineView
        self.lineV.frame = CGRectMake(space, H, btn.width, 2);
        self.lineV.backgroundColor = self.lineViewColor;
        [self.typeContentView addSubview:self.lineV];
    }
    
}


//set scrollView和子控制器
-(void)setUpScrollVAndChildVc{
    
    //状态栏+导航栏+contentViewBtn = 104
    CGFloat temp = 108;
    CGFloat width = MainScreen_size_width;
    CGFloat scrollH = MainScreen_size_height - temp;
    CGRect rect = CGRectMake(0, temp, width, scrollH);
    
    UIScrollView *scrollV= [[UIScrollView alloc]initWithFrame:rect];
    scrollV.contentSize = CGSizeMake(width*self.titleArr.count, scrollH);
    scrollV.delegate = self;
    scrollV.pagingEnabled = YES;
    
    [self.view addSubview:scrollV];
    self.scrollV = scrollV;
    
}


//btn的点击事件
-(void)clickTitleBtn:(UIButton *)clickBtn{
    

    //点击的按钮在父控件中的index
    NSInteger index = [self.titleContentV.subviews indexOfObject:clickBtn];
    
    //改变scrollView的偏移量
    [self.scrollV setContentOffset:CGPointMake(MainScreen_size_width*index, 0) animated:YES];
    
}

#pragma mark - UIScrollViewDelegate
//只要scrollView滑动就会调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //移除之前的添加过得view
    [self.showIngVc.view removeFromSuperview];
    
    //还原之前按钮的字体大小和字体颜色
    self.goalBtn.titleLabel.font = [UIFont systemFontOfSize:self.btnTitleDefaultFont];
    [self.goalBtn setTitleColor:self.btnTitleDefaultColor forState:UIControlStateNormal];


    //偏移量的索引
    NSInteger index = scrollView.contentOffset.x/MainScreen_size_width;
    
    //scrollView移动到哪个按钮
    UIButton *goalBtn = self.titleContentV.subviews[index];
    goalBtn.titleLabel.font = [UIFont systemFontOfSize:self.btnTitleSelectedFont];
    [goalBtn setTitleColor:self.btnTitleSelectedColor forState:UIControlStateNormal];
    self.goalBtn = goalBtn;
    

    UIViewController *indexCtr = self.childrenContentCtr[index];
    
    //显示当前的控制器
    self.showIngVc = indexCtr;
    
    indexCtr.view.frame = CGRectMake(index*MainScreen_size_width, 0, self.scrollV.width, self.scrollV.height);
    [self.scrollV addSubview:indexCtr.view];
    [self addChildViewController:indexCtr];
    
    
    //lineView 的坐标
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = self.lineV.frame;
        rect.origin.x = goalBtn.origin.x;
        self.lineV.frame = rect;
    }];

}



@end
