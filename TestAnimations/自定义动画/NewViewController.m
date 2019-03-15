//
//  NewViewController.m
//  TestAnimations
//
//  Created by Garenge on 2019/M/15.
//  Copyright © 2019 鹏鹏. All rights reserved.
//

#import "NewViewController.h"
#import "NewToViewController.h"
#import "NewAnimationTransition.h"

/** 自定义动画 参考https://www.jianshu.com/p/67c2300345b5
 *  当我们进行视图切换的时候，无论是push，pop还是通过PresentModal和dismiss时，我们可以把跳转动画分割为三个部分，
    1：第一个视图控制器显示。
    2：临时视图控制器 显示动画效果（并不是真的存在这个控制器，其实只有一个containerView）
    3：显示第二个视图控制器。用形象一点的说法，我们可以将第二部分也看做是一个临时的视图控制器，他执行一段关于UIView的动画，我们只要让动画的开始界面与控制器1一样，结束界面与视图控制器2一样。当动画执行结束，执行到第三步时，把临时的视图控制器释放。这样只要稍微实现一些UIView，CALayer的动画
 *  1. 协议<UIViewControllerAnimatedTransitioning>
 *  2.
 */

@interface NewViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NewToViewController *toVC = [[NewToViewController alloc] init];
    // 因为我需要拿到这个跳转过程,
    // 所以设置代理, 实现UIViewControllerTransitioningDelegate协议方法
    toVC.transitioningDelegate = self;
    [self presentViewController:toVC animated:YES completion:nil];
}

// 这个协议里面有好几个方法, 基本差不多, 看自己需要
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [NewAnimationTransition new];
}

@end
