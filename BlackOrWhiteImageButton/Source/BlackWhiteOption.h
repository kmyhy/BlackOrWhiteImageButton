//
//  BlackWhiteOption.h
//  BlackOrWhiteImageButton
//
//  Created by qq on 2018/11/8.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlackWhiteOption : NSObject
@property(assign, nonatomic) BOOL changeTextColor;          // 是否同时改变按钮文字颜色
@property(assign, nonatomic) BOOL changeBackgroundImage;    // 是否同时改变按钮背景图片
@end

NS_ASSUME_NONNULL_END
