//
//  MyAlertViewController.m
//  HLBAlertViewControllerExample
//
//  Created by HuangLibo on 2020/10/7.
//

#import "MyAlertViewController.h"
#import "MyAlertView.h"
#import <Masonry/Masonry.h>

@interface MyAlertViewController ()

@end

@implementation MyAlertViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.enableVerticalTranslateAnimation = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
}

#pragma mark - HLBAlertViewControllerDelegate

- (HLBAlertView *)customizedAlertView {
    MyAlertView *alertView = [[MyAlertView alloc] init];
    alertView.textField.text = self.originText;
    [self.view addSubview:alertView];
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-150);
        make.size.mas_equalTo(CGSizeMake(275, 150));
    }];
    
    [alertView.textField becomeFirstResponder];
    
    __weak typeof(self) weakself = self;
    alertView.okBtnClickBlock = ^(NSString * _Nonnull text) {
        if (weakself.resultBlock) {
            weakself.resultBlock(text);
        }
        [weakself dismissViewControllerAnimated:YES completion:nil];
    };
    return alertView;
}

@end
