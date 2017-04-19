//
//  DefaultNavigationController.m
//  Search
//
//  Created by John Lima on 19/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

#import "DefaultNavigationController.h"

@interface DefaultNavigationController ()

@end

@implementation DefaultNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateUI];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)updateUI {
    self.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes: @{NSFontAttributeName: [UIFont systemFontOfSize:17], NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

@end
