//
//  HeadView.m
//  XibViewWithXibView
//
//  Created by zsm on 2018/11/27.
//  Copyright © 2018年 XinHuoKeJi. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [[NSBundle mainBundle] loadNibNamed:@"HeadView" owner:self options:nil];
    [self addSubview:self.view];
}
 

@end
