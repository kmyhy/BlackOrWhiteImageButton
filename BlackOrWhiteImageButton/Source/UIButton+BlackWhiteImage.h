//
//  UIButton+BlackWhiteImage.h
//  PaletteDemo
//
//  Created by yhy on 2018/11/8.
//  Copyright © 2018年 kmyhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlackWhiteOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (BlackWhiteImage)

/**
 根据背景 view 中的某个区域设置 button 的 image(白或黑）
 @image     button 的 image
 @bgView    button 的背景 view
 @rect      button 在背景 view 上所占据的区域
 @option    选项，具体将 BlackWhiteOption 定义
 **/
-(void)setBlackWhiteImageWithImage:(UIImage*)image backgroundView:(UIView*)bgView inRegion:(CGRect)rect option:(nullable BlackWhiteOption*)option;
/**
 上一方法的简化版，但 rect 参数自动计算。假设 button 和 backgroundView 是同一个 parent view。
 */
-(void)setBlackWhiteImageWithImage:(UIImage*)image backgroundView:(UIView*)bgView option:(nullable BlackWhiteOption*)option;
@end

NS_ASSUME_NONNULL_END
