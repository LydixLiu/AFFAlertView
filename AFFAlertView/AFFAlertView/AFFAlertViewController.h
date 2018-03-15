//
//  AFFAlertViewController.h
//  AFFAlertView
//
//  Created by xuying on 2018/3/15.
//  Copyright © 2018年 Mystic-Liu. All rights reserved.
//


#import <UIKit/UIKit.h>
typedef void(^alertBlock)(NSInteger idx, NSString *title);

@interface AFFAlertViewController : UIViewController

+ (AFFAlertViewController *)alertWithtitle:(NSString *)title
                                    detail:(NSString *)detail
                              cancelButton:(NSString *)ccBtnTitle
                             comfirmButton:(NSString *)cfmBtnTitle
                              otherButtons:(NSArray<NSString *> *)others
                                     block:(alertBlock)block;

- (void)showInMainWindow;

- (void)showInViewController:(UIViewController *)vc;

- (void)dismiss;

@end
