# SegmentedChoose-
通过简单的几句代码，就可以实现像网易新闻一样的控制器之间的来回切换。
需要的的属性已经在.h中暴露出来
如些
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
