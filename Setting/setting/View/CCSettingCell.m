//
//  SettingCell.m
//  Setting
//
//  Created by zhouen on 15/9/18.
//  Copyright (c) 2015年 zhouen. All rights reserved.
//

#import "CCSettingCell.h"
#import "CCItem.h"
#import "UIView+VVExtension.h"
#import "CCConst.h"

@interface CCSettingCell()
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UIImageView *indicator;

@property (nonatomic, strong) UISwitch *aswitch;

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UIImageView *detailImageView;

@end
@implementation CCSettingCell

- (void)setItem:(CCItem *)item
{
    _item = item;
    [self updateUI];

}

- (void)updateUI {
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //如果有图片
    if (self.item.image) {
        [self setupImgView];
    }
    //功能名称
    if (self.item.text) {
        [self setupFuncLabel];
    }

    //accessoryType
    if (self.item.accessoryType) {
        [self setupAccessoryType];
    }
    //detailView
    if (self.item.detailText) {
        [self setupDetailText];
    }
    if (self.item.detailImage) {
        [self setupDetailImage];
    }

    //bottomLine
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 1, CCScreenWidth, 1)];
    line.backgroundColor = CCMakeColorWithRGB(234, 234, 234, 1);
    [self.contentView addSubview:line];
    
}

-(void)setupDetailImage
{
    self.detailImageView = [[UIImageView alloc]initWithImage:self.item.detailImage];
    self.detailImageView.centerY = self.contentView.centerY;
    switch (self.item.accessoryType) {
        case CCSettingAccessoryTypeNone:
            self.detailImageView.x = CCScreenWidth - self.detailImageView.width - CCDetailViewToIndicatorGap - 2;
            break;
        case CCSettingAccessoryTypeDisclosureIndicator:
            self.detailImageView.x = self.indicator.x - self.detailImageView.width - CCDetailViewToIndicatorGap;
            break;
        case CCSettingAccessoryTypeSwitch:
            self.detailImageView.x = self.aswitch.x - self.detailImageView.width - CCDetailViewToIndicatorGap;
            break;
        default:
            break;
    }
    [self.contentView addSubview:self.detailImageView];
}

- (void)setupDetailText
{
    self.detailLabel = [[UILabel alloc]init];
    self.detailLabel.text = self.item.detailText;
    self.detailLabel.textColor = CCMakeColorWithRGB(142, 142, 142, 1);
    self.detailLabel.font = [UIFont systemFontOfSize:CCDetailLabelFont];
    self.detailLabel.size = [self sizeForTitle:self.item.detailText withFont:self.detailLabel.font];
    self.detailLabel.centerY = self.contentView.centerY;
    
    switch (self.item.accessoryType) {
        case CCSettingAccessoryTypeNone:
            self.detailLabel.x = CCScreenWidth - self.detailLabel.width - CCDetailViewToIndicatorGap - 2;
            break;
        case CCSettingAccessoryTypeDisclosureIndicator:
            self.detailLabel.x = self.indicator.x - self.detailLabel.width - CCDetailViewToIndicatorGap;
            break;
        case CCSettingAccessoryTypeSwitch:
            self.detailLabel.x = self.aswitch.x - self.detailLabel.width - CCDetailViewToIndicatorGap;
            break;
        default:
            break;
    }
    
    [self.contentView addSubview:self.detailLabel];
}


- (void)setupAccessoryType
{
    switch (self.item.accessoryType) {
        case CCSettingAccessoryTypeNone:
            break;
        case CCSettingAccessoryTypeDisclosureIndicator:
            [self setupIndicator];
            break;
        case CCSettingAccessoryTypeSwitch:
            [self setupSwitch];
            break;
        default:
            break;
    }
}

- (void)setupSwitch
{
    [self.contentView addSubview:self.aswitch];
}

- (void)setupIndicator
{
    [self.contentView addSubview:self.indicator];
    
}

- (void)setupImgView
{
    self.imgView = [[UIImageView alloc]initWithImage:self.item.image];
    self.imgView.x = CCLeftImgToLeftGap;
    self.imgView.centerY = self.contentView.centerY;
    self.imgView.centerY = self.contentView.centerY;
    [self.contentView addSubview:self.imgView];
}

- (void)setupFuncLabel
{
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = self.item.text;
    self.titleLabel.textColor = CCMakeColorWithRGB(51, 51, 51, 1);
    self.titleLabel.font = [UIFont systemFontOfSize:CCTitleLabelFont];
    self.titleLabel.size = [self sizeForTitle:self.item.text withFont:self.titleLabel.font];
    self.titleLabel.centerY = self.contentView.centerY;
    self.titleLabel.x = CGRectGetMaxX(self.imgView.frame) + CCTitleLabelToImgGap;
    [self.contentView addSubview:self.titleLabel];
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}

- (UIImageView *)indicator
{
    if (!_indicator) {
        _indicator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-arrow1"]];
        _indicator.centerY = self.contentView.centerY;
        _indicator.x = CCScreenWidth - _indicator.width - CCIndicatorToRightGap;
    }
    return _indicator;
}

- (UISwitch *)aswitch
{
    if (!_aswitch) {
        _aswitch = [[UISwitch alloc]init];
        _aswitch.centerY = self.contentView.centerY;
        _aswitch.x = CCScreenWidth - _aswitch.width - CCIndicatorToRightGap;
        [_aswitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
    }
    return _aswitch;
}

- (void)switchTouched:(UISwitch *)sw
{
    __weak typeof(self) weakSelf = self;
    self.item.switchValueChanged(weakSelf.aswitch.isOn);
}

@end
