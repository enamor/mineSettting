//
//  Section.h
//  Setting
//
//  Created by zhouen on 16/9/2.
//  Copyright © 2016年 zhouen. All rights reserved.
//

#import "CCSection.h"

@implementation CCSection
- (instancetype)init {
    self = [super init];
    if (self) {
        self.headerHeight = 10.0f;
        self.footerHeight = 1.0f;
    }
    return self;
}
@end
