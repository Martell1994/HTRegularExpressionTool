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
}

// -- 验证中文
- (IBAction)checkChinese:(id)sender {
    _resultLb.text = [NSPredicate checkChinese:_inputStrTF.text]? @"中文" : @"非中文";
}

// -- 验证手机号
- (IBAction)checkPhone:(id)sender {
    _resultLb.text = [NSPredicate checkPhone:_inputStrTF.text] ? @"合法手机号" : @"非法手机号";
}

// -- 验证金额
- (IBAction)checkMoney:(id)sender {
    _resultLb.text = [NSPredicate checkMoney:_inputStrTF.text] ? @"属于金额" : @"非金额";
}

// -- 验证邮箱
- (IBAction)checkEmail:(id)sender {
    _resultLb.text = [NSPredicate checkEmail:_inputStrTF.text] ? @"邮箱合法" : @"邮箱不合法";
}


// -- 验证身份证
-(IBAction)checkIndentityCard:(id)sender {
    _resultLb.text = [NSPredicate checkIdentityCardNumber:_inputStrTF.text] ? @"身份证合法" : @"身份证不合法";
}

- (IBAction)checkURL:(id)sender {
    _resultLb.text = [NSPredicate checkUrl:_inputStrTF.text] ? @"URL正确" : @"URL错误";
}

// -- URL
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_inputStrTF resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
