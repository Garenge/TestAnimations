//
//  ViewController2.m
//  TestAnimations
//
//  Created by Garenge on 2019/M/15.
//  Copyright © 2019 鹏鹏. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController1.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadSubViews {
    [super loadSubViews];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)jump:(UIButton *)sender {
    ViewController1 *vc1 = [ViewController1 new];
    
    if (sender.tag % 2 == 0) {
        // push
        if (self.navigationController) {
            [self.navigationController pushViewController:vc1 animated:YES];
        } else {
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc1];
            [self presentViewController:navi animated:YES completion:nil];
        }
    } else {
        // present
        [self presentViewController:vc1 animated:YES completion:nil];
    }
}

@end
