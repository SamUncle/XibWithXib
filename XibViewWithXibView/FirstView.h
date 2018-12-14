//
//  FirstView.h
//  XibViewWithXibView
//
//  Created by zsm on 2018/11/25.
//  Copyright © 2018年 XinHuoKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperXibView.h"
NS_ASSUME_NONNULL_BEGIN

@interface FirstView : SuperXibView
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

NS_ASSUME_NONNULL_END
