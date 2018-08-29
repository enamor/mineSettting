//
//  Item
//  Setting
//
//  Created by zhouen on 16/9/2.
//  Copyright © 2016年 zhouen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CCSettingAccessoryType) {
    CCSettingAccessoryTypeNone,
    CCSettingAccessoryTypeDisclosureIndicator,
    CCSettingAccessoryTypeSwitch,
    CCSettingAccessoryTypeCustomView,
};


@interface CCItem : NSObject
@property (nonatomic, copy)      NSString    *text;
@property (nonatomic, copy)      NSString    *detailText;

@property (nonatomic, strong)    UIImage     *image;
@property (nonatomic, strong)    UIImage     *detailImage;

@property (nonatomic, assign)    BOOL    isOn;//switch状态

//暂未实现
@property (nonatomic, strong)   UIView      *customView;

@property (nonatomic, assign)   CCSettingAccessoryType   accessoryType;

@property (nonatomic, copy) void (^execute)(void); /**<      点击item要执行的代码*/
@property (nonatomic, copy) void (^switchValueChanged)(BOOL isOn);

@end
