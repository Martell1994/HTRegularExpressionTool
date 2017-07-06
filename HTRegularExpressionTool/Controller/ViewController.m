//
//  ViewController.m
//  HTRegularExpressionTool
//
//  Created by Huiting Mao on 2017/7/6.
//  Copyright © 2017年 Martell. All rights reserved.
//

#import "ViewController.h"
#import "NSPredicate+HTAdditions.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputStrTF;
@property (weak, nonatomic) IBOutlet UILabel *resultLb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)checkEmail:(id)sender {
    _resultLb.text = [NSPredicate checkEmail:_inputStrTF.text] ? @"邮箱合法" : @"邮箱不合法";
}


// -- 验证身份证
-(IBAction)checkIndentityCard:(id)sender {
    _resultLb.text = [NSPredicate checkIdentityCardNumber:_inputStrTF.text] ? @"身份证合法" : @"身份证不合法";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
