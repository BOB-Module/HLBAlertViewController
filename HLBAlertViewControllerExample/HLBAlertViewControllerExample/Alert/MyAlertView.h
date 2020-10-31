//
//  MyAlertView.h
//  HLBAlertViewControllerExample
//
//  Created by HuangLibo on 2020/10/7.
//

#import <HLBAlertViewController/HLBAlertView.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyAlertView : HLBAlertView

@property (nonatomic, copy) void(^okBtnClickBlock)(NSString *text);

@property (nonatomic, strong) UITextField *textField;

@end

NS_ASSUME_NONNULL_END
