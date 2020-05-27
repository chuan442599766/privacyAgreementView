//
//  ViewController.m
//  GCHPrivacyAgreementView
//
//  Created by GCH on 2020/5/8.
//  Copyright © 2020 cn.hdcb.com. All rights reserved.
//

#import "ViewController.h"
#import "ZXPrivacyAgreementView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    ZXPrivacyAgreementView *view = [[ZXPrivacyAgreementView alloc] initWithFrame:self.view.frame];
    [view showPrivacyAgreementView:self.view];
    
}


@end
