//
//  JZPictureKeyboard.m
//  JZPictureKeyboard
//
//  Created by RoyalMjz on 15/4/1.
//  Copyright © 2015年 RoyalMjz. All rights reserved.
//

#import "JZPictureKeyboard.h"

static CGFloat const btnAlpha = 0.8;
static CGFloat const btnRadius = 4;

@interface JZPictureKeyboard (){
    
    id inputView;
}

@property(strong, nonatomic)UIImageView *backgroundImageView;

@end

@implementation JZPictureKeyboard

/**
 *  初始化
 */
-(instancetype)initWithTitleColor:(UIColor *)color backGroundImage:(UIImage *)image{
    
    self = [[JZPictureKeyboard alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3)];
    
    self.titleColor = color ? color : [UIColor blackColor];
    
    self.backgroundImage = image;
    //self.backgroundColor = color;
    //self.font = font;
    
    [self setUpViews];
    
    return self;
}

/**
 *  初始化界面
 */
-(void)setUpViews{
    
    if (self.backgroundImage) {
        self.backgroundImageView.image = self.backgroundImage;
        self.backgroundImageView.userInteractionEnabled = YES;
        [self addSubview:self.backgroundImageView];
    }
    
    if (self.backgroundColor) {
        
        self.backgroundColor = self.backgroundColor;
    }
    
    for (int i = 0; i<12; i++) {
        
        UIButton *btn = [[UIButton alloc] init];
        
        if (self.font) {
            btn.titleLabel.font = self.font;
        }
        [btn setTitleColor:self.titleColor forState:UIControlStateNormal];
        btn.layer.cornerRadius = btnRadius;
        btn.showsTouchWhenHighlighted = YES;
        
        
        UIColor *btnColorNormal = [UIColor colorWithRed:1 green:1 blue:1 alpha:btnAlpha];
        UIColor *colorHightlighted = [UIColor colorWithRed:186.0/255 green:189.0/255 blue:194.0/255 alpha:1.0];
    
        if (i == 9 || i == 11){
            
            UIColor *colorTemp = btnColorNormal;
            btnColorNormal = colorHightlighted;
            colorHightlighted = colorTemp;
        }
        
        btn.backgroundColor = btnColorNormal;
        
        NSString *titleStr;
        switch (i) {
            case 11:{

                UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - (4*10))/3/2-11, (self.frame.size.height - (5*10))/4/2-9, 22, 17)];
                arrow.image = [UIImage imageNamed:@"deleteImage"];
                [btn addSubview:arrow];
                
                [btn addTarget:self action:@selector(deleteBtnAction) forControlEvents:UIControlEventTouchUpInside];
                [btn addGestureRecognizer:[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longpressGesture)]];
                
                break;
            }
            case 10:
                titleStr = @"0";
                [btn setTitle: titleStr forState:UIControlStateNormal];
                
                [btn addTarget:self action:@selector(numberBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 9:
                titleStr = @".";
                [btn setTitle: titleStr forState:UIControlStateNormal];
                [ btn addTarget:self action:@selector(numberBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                break;
            default:
                [ btn addTarget:self action:@selector(numberBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                
                break;
        }
        
        if (i < 9) {
            [btn setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        }
        
        CGFloat dis = 10;
        CGFloat btnW =(self.frame.size.width - (4*dis))/3 ;
        CGFloat btnH =(self.frame.size.height - (5*dis))/4 ;
        CGFloat btnY = (i/3)*(btnH + dis)+dis;
        CGFloat btnX = (i%3)*(btnW + dis)+dis;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        if (self.backgroundImage) {
            [self.backgroundImageView addSubview:btn];
        }else{
            [self addSubview:btn];
        }
        
    }
    
}

#pragma mark - Action

//完成
-(void)finishBtnAction{

    [inputView endEditing:YES];
}

//删除
-(void)deleteBtnAction{
    
    if ([inputView isFirstResponder]) {
        
        [inputView deleteBackward];
    }
}

//输入
-(void)numberBtnAction:(UIButton *)btn{
    
    if ([inputView isFirstResponder]) {
        
        [inputView insertText:btn.titleLabel.text];
    }
}

//长按删除
-(void)longpressGesture{
    
    [inputView setText:nil];
}

#pragma mark - get set
- (UIImageView *)backgroundImageView{
    
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.frame];
    }
    return _backgroundImageView;
}

- (void)setInputView:(UIView *)view{
    
    if ([view isKindOfClass:[UITextField class]]) {
        UITextField *m =  (UITextField *)  view;
        m.inputView  = self;
        
    }
    if ([view isKindOfClass:[UITextView class]]) {
        UITextView *m =  (UITextView *)  view;
        m.inputView  = self;
        
    }
    inputView = view;
}

@end
