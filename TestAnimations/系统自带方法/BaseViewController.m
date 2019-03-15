//
//  BaseViewController.m
//  TestAnimations
//
//  Created by Garenge on 2019/M/15.
//  Copyright © 2019 鹏鹏. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViews];
}

- (void)loadSubViews {
    
    self.view.backgroundColor = [UIColor whiteColor];
    // mid button
    UIButton *preButton = [UIButton buttonWithType:UIButtonTypeSystem];
    preButton.frame = CGRectMake(100, 100, 100, 50);
    [preButton setTitle:@"present" forState:UIControlStateNormal];
    [preButton addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
    preButton.tag = 9527;
    [self.view addSubview:preButton];
    
    // mid button
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pushButton.frame = CGRectMake(100, 200, 100, 50);
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
    pushButton.tag = 9528;
    [self.view addSubview:pushButton];
    
    UIButton *missButton = [UIButton buttonWithType:UIButtonTypeSystem];
    missButton.frame = CGRectMake(100, 300, 100, 50);
    [missButton setTitle:@"miss" forState:UIControlStateNormal];
    [missButton addTarget:self action:@selector(miss:) forControlEvents:UIControlEventTouchUpInside];
    missButton.tag = 12138;
    [self.view addSubview:missButton];
    
    UILabel *tips = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, 200, 20)];
    [self.view addSubview:tips];
    
    NSArray *typesArray = [self typesArray];
    NSString *type = typesArray[arc4random_uniform(typesArray.count)];
    tips.text = type;
    
    //创建动画
    CATransition *animation = [CATransition animation];
    //设置运动轨迹的速度
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //设置动画类型
    animation.type = type;
    //@"cube";
    //设置动画时长
    animation.duration =0.5f;
    //设置运动的方向
    animation.subtype =kCATransitionFromRight;
    //控制器间跳转动画
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
}

- (NSArray *)typesArray {
    return @[@"fade",                   //淡入淡出
             @"push",                      //推挤
             @"reveal",                      //揭开
             @"moveIn",                    //覆盖
             @"cube",                      //立方体
             @"suckEffect",                 //吮吸
             @"oglFlip",                    //翻转
             @"rippleEffect",                //波纹
             @"pageCurl",                   //翻页
             @"pageUnCurl",                 //反翻页
             @"cameraIrisHollowOpen",        //开镜头
             @"cameraIrisHollowClose",       //关镜头
             @"curlDown",                   //下翻页
             @"curlUp",                     //上翻页
             @"flipFromLeft",               //左翻转
             @"flipFromRight",              //右翻转
             ];
}

- (void)jump:(UIButton *)sender {
    
}

- (void)miss:(UIButton *)sender {
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count > 1) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
