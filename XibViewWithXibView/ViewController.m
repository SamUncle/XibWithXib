//
//  ViewController.m
//  XibViewWithXibView
//
//  Created by zsm on 2018/11/25.
//  Copyright © 2018年 XinHuoKeJi. All rights reserved.
//

#import "ViewController.h"
#import "HeadView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet HeadView *headView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用HeadView 需要指定父视图的frame 否则按照xib里面的frame进行布局
    //    self.headView.view.frame = CGRectMake(0, 30, 300, 50);
    
    //使用FirstView布局无需考虑布局问题，需要继承自SuperXibView视图
    self.showView.blueView.backgroundColor = [UIColor redColor];
    self.showView.lab.backgroundColor = [UIColor greenColor];
    
}


@end
