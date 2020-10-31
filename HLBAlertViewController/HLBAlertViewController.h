//
//  HLBAlertViewController.h
//  Pods-HLBAlertViewControllerExample
//
//  Created by HuangLibo on 2020/10/7.
//

#import <UIKit/UIKit.h>

@class HLBAlertView;

NS_ASSUME_NONNULL_BEGIN

@protocol HLBAlertViewControllerDelegate <NSObject>

@required
/// 指定自定义的 alert view
- (HLBAlertView *)customizedAlertView;

@end

@interface HLBAlertViewController : UIViewController

@property (nonatomic, weak) id<HLBAlertViewControllerDelegate> delegate;

/// 是否启用垂直平移的动画
@property (nonatomic, assign) BOOL enableVerticalTranslateAnimation;

/// CGAffineTransformMakeScale 的值, 默认值是 1.1
@property (nonatomic, assign) CGFloat makeScaleValue;

/// CGAffineTransformTranslate 的 y 值, 默认值是 100
@property (nonatomic, assign) CGFloat verticalTranslateValue;

/// 动画的时间(alpha 和 transform 动画), 默认值是 0.15
@property (nonatomic, assign) NSTimeInterval animationTime;

@end

NS_ASSUME_NONNULL_END
