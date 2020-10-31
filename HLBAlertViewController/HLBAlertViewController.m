//
//  HLBAlertViewController.m
//  Pods-HLBAlertViewControllerExample
//
//  Created by HuangLibo on 2020/10/7.
//

#import "HLBAlertViewController.h"
#import "HLBAlertView.h"

@interface HLBAlertViewController () <HLBAlertViewControllerDelegate>

@property (nonatomic, strong) HLBAlertView *alertView;

@end

@implementation HLBAlertViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 转场方式: 淡入淡出
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        // presentation 方式: 上一个页面继续显示在当前页面下方
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        self.makeScaleValue = 1.1;
        self.verticalTranslateValue = 100;
        self.animationTime = 0.15;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.delegate = self;
    
    if (![self.delegate respondsToSelector:@selector(customizedAlertView)]) {
        NSAssert(NO, @"子类必须 override `-alertView` 方法");
    } else {
        self.alertView = [self.delegate customizedAlertView];
        self.alertView.transform = CGAffineTransformMakeScale(self.makeScaleValue, self.makeScaleValue);
        if (self.enableVerticalTranslateAnimation) {
            self.alertView.transform = CGAffineTransformTranslate(self.alertView.transform, 0, self.verticalTranslateValue);            
        }
        self.alertView.alpha = 0;
        
        // 延迟 0.1 秒是为了等页面布局好之后再做动画
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:self.animationTime delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.alertView.transform = CGAffineTransformMakeScale(1, 1);
                self.alertView.alpha = 1;
            } completion:^(BOOL finished) {
            }];
        });
    }
}

@end
