//
//  HLBAlertView.m
//  HLBAlertViewController
//
//  Created by HuangLibo on 2020/10/7.
//

#import "HLBAlertView.h"

@implementation HLBAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // iOS 11 的默认背景色是黑色, 需要手动设置为白色
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
