//
//  VVConst.h
//  Setting
//
//  Created by zhouen on 15/9/23.
//  Copyright © 2015年 zhouen. All rights reserved.
//

#ifndef CCConst_h
#define CCConst_h


#define CCMakeColorWithRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
//获取屏幕尺寸
#define CCScreenWidth      [UIScreen mainScreen].bounds.size.width
#define CCScreenHeight     [UIScreen mainScreen].bounds.size.height
#define CCScreenBounds     [UIScreen mainScreen].bounds


//功能图片到左边界的距离
#define CCLeftImgToLeftGap 15

//功能名称字体
#define CCTitleLabelFont 14

//功能名称到功能图片的距离,当功能图片Img不存在时,等于到左边界的距离
#define CCTitleLabelToImgGap 15

//指示箭头或开关到右边界的距离
#define CCIndicatorToRightGap 15

//详情文字字体
#define CCDetailLabelFont 12

//详情到指示箭头或开关的距离
#define CCDetailViewToIndicatorGap 13

#endif /* CCConst_h */
