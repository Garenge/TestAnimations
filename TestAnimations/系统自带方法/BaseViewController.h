//
//  BaseViewController.h
//  TestAnimations
//
//  Created by Garenge on 2019/M/15.
//  Copyright © 2019 鹏鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// v1 -> v2 -> v1...循环往复
@interface BaseViewController : UIViewController

- (void)loadSubViews;
- (void)jump:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
