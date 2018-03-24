//
//  SegmentView.m
//  MyTui
//
//  Created by gl on 16/6/3.
//  Copyright © 2016年 hukewei. All rights reserved.
//
//屏幕最多显示按钮个数
#define MAX_TitleNumInWindow 5
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "HsSegmentView.h"

@interface HsSegmentView ()
/**
 *  按钮数组
 */
@property(nonatomic, strong) NSMutableArray *btnArray;
/**
 *  按钮title数组
 */
@property(nonatomic, strong) NSArray *titleArray;
/**
 *  按钮
 */
@property(nonatomic, strong) UIButton *titleBtn;
/**
 *  ScrollView
 */
@property(nonatomic, strong) UIScrollView *bgScrollView;
/**
 *  自定义水平滚动条
 */
@property(nonatomic, strong) UIView *selectLine;
/**
 *  按钮的宽度
 */
@property(nonatomic, assign) CGFloat btnWidth;
@end

@implementation HsSegmentView

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titleArray
                   clickBlick:(btnClickBlock)block {
  self = [super initWithFrame:frame];
  if (self) {
      //设置按钮的宽度
    _btnWidth = 0.0;
    if (titleArray.count < MAX_TitleNumInWindow + 1) {
      _btnWidth = SCREEN_WIDTH / titleArray.count;
    } else {
      _btnWidth = SCREEN_WIDTH / MAX_TitleNumInWindow;
    }
      //设置默认属性
    _titleArray = titleArray;
    _defaultIndex = 1;
    _titleFont =  [UIFont systemFontOfSize:15];
    _btnArray = [[NSMutableArray alloc] initWithCapacity:0];
    _titleNomalColor = [UIColor grayColor];
    _titleSelectColor = [UIColor redColor];
      
      //无意义,为了解决(0，-64)问题
      UIImageView *nothing=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
      [self addSubview:nothing];
       
    _bgScrollView = [[UIScrollView alloc]
        initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];
    _bgScrollView.backgroundColor = [UIColor whiteColor];
      //隐藏水平滚动条
    _bgScrollView.showsHorizontalScrollIndicator = NO;
      //设置scrollview可以滚动的区域
    _bgScrollView.contentSize =
        CGSizeMake(_btnWidth * titleArray.count, self.frame.size.height);
    [self addSubview:_bgScrollView];
    //自定义水平滚动条
    _selectLine = [[UIView alloc]
        initWithFrame:CGRectMake(_btnWidth*30/125, self.frame.size.height - 2, _btnWidth*65/125, 2)];
    _selectLine.backgroundColor = _titleSelectColor;
    [_bgScrollView addSubview:_selectLine];
    //创建按钮
    for (int i = 0; i < titleArray.count; i++) {
      UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
      btn.frame = CGRectMake(_btnWidth * i, 1, _btnWidth, self.frame.size.height - 3);
      btn.tag = i + 1;
      [btn setTitle:titleArray[i] forState:UIControlStateNormal];
      [btn setTitleColor:_titleNomalColor forState:UIControlStateNormal];
      [btn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
      [btn addTarget:self
                    action:@selector(btnClick:)
          forControlEvents:UIControlEventTouchDown];
      [btn setBackgroundColor:[UIColor colorNamed:@"#FFFFFF"]];
      btn.titleLabel.font = _titleFont;
      [_bgScrollView addSubview:btn];
      [_btnArray addObject:btn];
      if (i == 0) {
        _titleBtn = btn;
        btn.selected = YES;
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
      }
      self.block = block;
    }
  }

  return self;
}
/**
 *  按钮点击事件
 *
 *  @param btn btn description
 */
- (void)btnClick:(UIButton *)btn {
  if (self.block) {
    self.block(btn.tag);
  }

  if (btn.tag == _defaultIndex) {
    return;
  } else {
    _titleBtn.selected = !_titleBtn.selected;
    _titleBtn = btn;
    _titleBtn.selected = YES;
    _defaultIndex = btn.tag;
      btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
  }

  //计算偏移量
  CGFloat offsetX = btn.frame.origin.x -  2* _btnWidth;
  if (offsetX < 0) {
    offsetX = 0;
  }
  CGFloat maxOffsetX = _bgScrollView.contentSize.width - SCREEN_WIDTH;
  if (offsetX > maxOffsetX) {
    offsetX = maxOffsetX;
  }
  //按钮切换动画
  [UIView animateWithDuration:.2
      animations:^{

        [_bgScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        _selectLine.frame =
            CGRectMake(_btnWidth*30/125+btn.frame.origin.x, self.frame.size.height - 2, _btnWidth*65/125, 2);

      }
      completion:^(BOOL finished){

      }];
    [self updateView];
}
#pragma mark - 重写公开的属性的set方法,改变属性的值
- (void)setTitleNomalColor:(UIColor *)titleNomalColor {
  _titleNomalColor = titleNomalColor;
  [self updateView];
}

- (void)setTitleSelectColor:(UIColor *)titleSelectColor {
  _titleSelectColor = titleSelectColor;
  [self updateView];
}

- (void)setTitleFont:(UIFont *)titleFont {
  _titleFont = titleFont;
  [self updateView];
}

- (void)setDefaultIndex:(NSInteger)defaultIndex {
  _defaultIndex = defaultIndex;
  [self updateView];
}
/**
 *  更新UI
 */
- (void)updateView {
  for (UIButton *btn in _btnArray) {
    [btn setTitleColor:_titleNomalColor forState:UIControlStateNormal];
    [btn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
    btn.titleLabel.font = _titleFont;
    _selectLine.backgroundColor = _titleSelectColor;

    if (btn.tag - 1 == _defaultIndex - 1) {
      _titleBtn = btn;
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
      btn.selected = YES;
      _selectLine.frame =
          CGRectMake(_btnWidth*30/125+btn.frame.origin.x, self.frame.size.height - 2, _btnWidth*65/125, 2);
    } else {
      btn.selected = NO;
        btn.titleLabel.font = _titleFont;
    }
  }
}

@end
