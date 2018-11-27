//
//  ViewController.m
//  XibViewWithXibView
//
//  Created by zsm on 2018/11/25.
//  Copyright © 2018年 XinHuoKeJi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *headView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.showView.blueView.backgroundColor = [UIColor redColor];
}


@end
