//
//  MainViewController.m
//  JZNumberKeyboard
//
//  Created by RoyalMjz on 15/11/28.
//  Copyright © 2015年 RoyalMjz. All rights reserved.
//

#import "MainViewController.h"
#import "JZNumberKeyboard.h"

@interface MainViewController ()<UITextFieldDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 100, 100, 44)];
    textField.backgroundColor = [UIColor lightGrayColor];
    textField.delegate = self;
    
    //[UIImage imageNamed:@"keyboardImage"]
    JZNumberKeyboard *keyBoard = [[JZNumberKeyboard alloc] initWithTitleColor:nil backGroundImage:[UIImage imageNamed:@"keyboardImage"]];
    [keyBoard setInputView:textField];
    [self.view addSubview:textField];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
