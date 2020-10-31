//
//  MyAlertView.m
//  HLBAlertViewControllerExample
//
//  Created by HuangLibo on 2020/10/7.
//

#import "MyAlertView.h"
#import <Masonry/Masonry.h>

@interface MyAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *okBtn;

@property (nonatomic, strong) UIVisualEffectView *effectView;

@end

@implementation MyAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 6.f;
        
        UIBlurEffect *effect =  [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        self.effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        [self addSubview:self.effectView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.text = @"修改按钮的标题";
        self.titleLabel.font = [UIFont systemFontOfSize:18.f];
        [self addSubview:self.titleLabel];
        
        self.textField = [[UITextField alloc] init];
        self.textField.layer.masksToBounds = YES;
        self.textField.layer.cornerRadius = 6.f;
        self.textField.layer.borderWidth = 1.f;
        self.textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.textField.placeholder = @"请输入...";
        self.textField.textColor = [UIColor colorWithRed:51.f/255 green:51.f/255 blue:51.f/255 alpha:1];
        self.textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
        self.textField.leftViewMode = UITextFieldViewModeAlways;
        self.textField.clearButtonMode = UITextFieldViewModeAlways;
        [self addSubview:self.textField];
        
        self.okBtn = [[UIButton alloc] init];
        [self.okBtn setTitle:@"OK" forState:UIControlStateNormal];
        self.okBtn.backgroundColor = [UIColor grayColor];
        [self.okBtn addTarget:self action:@selector(okBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.okBtn];
        
        [self.effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.centerX.equalTo(self);
        }];
        
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(200, 30));
        }];
        
        [self.okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-15);
            make.size.mas_equalTo(CGSizeMake(50, 25));
        }];
    }
    return self;
}

- (void)okBtnClick:(UIButton *)sender {
    if (self.okBtnClickBlock) {
        self.okBtnClickBlock(self.textField.text);
    }
}

@end
