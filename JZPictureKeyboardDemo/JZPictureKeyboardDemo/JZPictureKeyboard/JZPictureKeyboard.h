//
//  JZPictureKeyboard.h
//  JZPictureKeyboard
//
//  Created by RoyalMjz on 15/4/1.
//  Copyright © 2015年 RoyalMjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZPictureKeyboard : UIView

@property (strong, nonatomic)UIColor    *titleColor;/**< 文字颜色*/
@property (strong, nonatomic)UIFont     *font;/**< 字体*/
@property (strong, nonatomic)UIColor    *backgroundColor;/**< 键盘背景颜色*/
@property (strong, nonatomic)UIImage    *backgroundImage;/**< 键盘背景图片*/

/**
 *  初始化
 */
-(instancetype)initWithTitleColor:(UIColor *)color backGroundImage:(UIImage *)image;

/**
 *  传入Textfield或者TextView
 */
-(void)setInputView:(UIView *)view;

@end



