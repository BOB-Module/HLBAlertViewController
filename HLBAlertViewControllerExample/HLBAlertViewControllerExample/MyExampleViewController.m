//
//  MyExampleViewController.m
//  HLBAlertViewControllerExample
//
//  Created by HuangLibo on 2020/10/31.
//

#import "MyExampleViewController.h"
#import "MyAlertViewController.h"
#import <Masonry/Masonry.h>

@interface MyExampleViewController ()

@property (nonatomic, strong) UIButton *exampleBtn;

@end

@implementation MyExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];

    self.exampleBtn = [[UIButton alloc] init];
    [self.exampleBtn setTitle:@"点击弹出 alert" forState:UIControlStateNormal];
    self.exampleBtn.backgroundColor = [UIColor lightGrayColor];
    [self.exampleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.exampleBtn];
    
    [self.exampleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(180, 100));
    }];
    
    // 模拟点击, 方便测试
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self btnClick:nil];
    });
}

- (void)btnClick:(UIButton *)sender {
    MyAlertViewController *alertVC = [[MyAlertViewController alloc] init];
    alertVC.originText = [self.exampleBtn titleForState:UIControlStateNormal];
    __weak typeof(self) weakself = self;
    alertVC.resultBlock = ^(NSString * _Nonnull text) {
        [weakself.exampleBtn setTitle:text forState:UIControlStateNormal];
    };
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
