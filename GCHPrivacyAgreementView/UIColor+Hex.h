//
//  UIColor+Hex.h
//  BocElife
//
//  Created by 刘士林 on 15/7/10.
//  Copyright (c) 2015年 wanhuahai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

//[UIColor colorWithHexString:@"#708c3b"]
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
