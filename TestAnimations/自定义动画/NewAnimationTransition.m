//
//  NewAnimationTransition.m
//  TestAnimations
//
//  Created by Garenge on 2019/M/15.
//  Copyright © 2019 鹏鹏. All rights reserved.
//

#import "NewAnimationTransition.h"
#import "NewToViewController.h"

// 自定义一个转场动画
@interface NewAnimationTransition() <CAAnimationDelegate>
@property (nonatomic, weak) id transitionContext;
@end

@implementation NewAnimationTransition

//这个方法中我们只要返回页面跳转动画的执行时间
-(NSTimeInterval)transitionDuration:(id < UIViewControllerContextTransitioning >)transitionContext {
    return 0.5;
}
//在这个方法中实现具体动画
-(void)animateTransition:(id < UIViewControllerContextTransitioning >)transitionContext {
    // 方法中的参数transitionContext是当前临时控制器界面的上下文。
    self.transitionContext = transitionContext;
    // 通过上下文，我们先拿到临时视图控制器的背景视图containerView，他已经有一个子视图，即fromViewController.view。
    // 我们要做的是，先获得toViewController
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:toVC.view];
    
    // 要实现Demo里的效果，我们需要CAShapeLayer来给toView做遮挡，
    // 然后从修改ShapeLayer.path属性，从一个小圆变成一个囊括全屏的大圆，小圆大圆我们通过UIBezierPath画出来
    
    CGFloat kWindowH = [UIScreen mainScreen].bounds.size.height;
    CGFloat kWindowW = [UIScreen mainScreen].bounds.size.width;
    CGRect circleCenterRect = CGRectMake(120, kWindowH, 50, 50);
    //圆圈1--小圆
    UIBezierPath *smallCircleBP =  [UIBezierPath bezierPathWithOvalInRect:circleCenterRect];
    //圆圈2--大圆
    //以_circleCenterRect的中心为圆心
    CGFloat centerX = circleCenterRect.origin.x+circleCenterRect.size.width/2;
    CGFloat centerY = circleCenterRect.origin.y+circleCenterRect.size.height/2;
    //找出圆心到页面4个角 最长的距离 作为半径
    CGFloat r1 = (kWindowW-centerX)>centerX?(kWindowW-centerX):centerX;
    CGFloat r2 = (kWindowW-centerY)>centerY?(kWindowW-centerY):centerY;
    CGFloat radius = sqrt((r1 * r1) + (r2 * r2));
    UIBezierPath *bigCircleBP = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(circleCenterRect, -radius, -radius)];
    //    画完圆后通过CABasicAnimation执行：
    
    //设置maskLayer
    CAShapeLayer *maskLayer = [CAShapeLayer layer];//将它的 path 指定为最终的 path 来避免在动画完成后会回弹
    toVC.view.layer.mask = maskLayer;
    maskLayer.path = bigCircleBP.CGPath;
    //执行动画
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(smallCircleBP.CGPath);
    maskLayerAnimation.toValue = (__bridge id)((bigCircleBP.CGPath));
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //告诉 系统这个 transition 完成
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    //清除 fromVC 的 mask
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}


@end
