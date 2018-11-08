//
//  UIButton+BlackWhiteImage.m
//  PaletteDemo
//
//  Created by yhy on 2018/11/8.
//  Copyright © 2018年 kmyhy. All rights reserved.
//

#import "UIButton+BlackWhiteImage.h"
#import "UIImage+Palette.h"
#import "UIColor+Complementary.h"
#import "UIColor+Hex.h"
#import "UIImage+Extension.h"
#import "UIView+snapshot.h"

@implementation UIButton (BlackWhiteImage)
// 根据一张背景图片生成一张对比强烈的黑白色图片作为 button 的 image
-(void)setBlackWhiteImageWithImage:(UIImage*)image backgroundImage:(UIImage*)bgImage option:(BlackWhiteOption*)option{
    [bgImage getPaletteImageColor:^(PaletteColorModel *recommendColor, NSDictionary *allModeColorDic, NSError *error) {
        UIColor* color = [UIColor colorWithHexString:recommendColor.imageColorString];
        UIColor* complementaryColor = [color blackWhiteComplementaryColor];
        UIImage* colorImage = [image colorImage:complementaryColor];
        [self setImage:colorImage forState:UIControlStateNormal];
        
        if(option && option.changeTextColor){
        
            [self setTitleColor:complementaryColor forState:UIControlStateNormal];
            
        }
    }];
}
-(void)setBlackWhiteImageWithImage:(UIImage*)image backgroundView:(UIView*)bgView inRegion:(CGRect)rect option:(BlackWhiteOption*)option{
    UIImage* snapshot = [bgView snapshot];
    snapshot = [snapshot cutWithRect:rect];
    
    if(option && option.changeBackgroundImage){
        [self setBackgroundImage:snapshot forState:UIControlStateNormal];
    }
    
    [self setBlackWhiteImageWithImage:image backgroundImage:snapshot option:option];
}

-(void)setBlackWhiteImageWithImage:(UIImage*)image backgroundView:(UIView*)bgView option:(nullable BlackWhiteOption*)option{
    CGRect r = [self convertRect:self.bounds toView:bgView];
    [self setBlackWhiteImageWithImage:image backgroundView:bgView inRegion:r option:option];
}
@end
