//
//  MyAlertViewController.h
//  HLBAlertViewControllerExample
//
//  Created by HuangLibo on 2020/10/7.
//

#import <HLBAlertViewController/HLBAlertViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyAlertViewController : HLBAlertViewController

@property (nonatomic, copy) NSString *originText;

@property (nonatomic, copy) void(^resultBlock)(NSString *text);

@end

NS_ASSUME_NONNULL_END
