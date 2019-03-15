//
//  ViewController1.m
//  TestAnimations
//
//  Created by Garenge on 2019/M/15.
//  Copyright © 2019 鹏鹏. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadSubViews {
    [super loadSubViews];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)jump:(UIButton *)sender {
    ViewController2 *vc2 = [ViewController2 new];
    
    if (sender.tag % 2 == 0) {
        // push
        if (self.navigationController) {
            [self.navigationController pushViewController:vc2 animated:YES];
        } else {
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc2];
            [self presentViewController:navi animated:YES completion:nil];
        }
    } else {
        // present
        [self presentViewController:vc2 animated:YES completion:nil];
    }
    
}

@end
