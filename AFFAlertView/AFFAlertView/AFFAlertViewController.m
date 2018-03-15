//
//  AFFAlertViewController.m
//  AFFAlertView
//
//  Created by xuying on 2018/3/15.
//  Copyright © 2018年 Mystic-Liu. All rights reserved.
//

#import "AFFAlertViewController.h"

@interface AFFAlertViewController () {
    alertBlock _block;
}

@property (nonatomic, copy) NSString *alertTitle;

@property (nonatomic, copy) NSString *detail;

@property (nonatomic, copy) NSString *cancelButtonTitle;

@property (nonatomic, copy) NSString *comfirmButtonTitle;

@property (nonatomic, copy) NSArray<NSString *> *otherButtonTitles;

@property (nonatomic, weak) UIViewController *showingVC;

@end

@implementation AFFAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

+ (AFFAlertViewController *)alertWithtitle:(NSString *)title
                                    detail:(NSString *)detail
                              cancelButton:(NSString *)ccBtnTitle
                             comfirmButton:(NSString *)cfmBtnTitle
                              otherButtons:(NSArray<NSString *> *)others
                                     block:(alertBlock)block {
    return [[self alloc] initWithtitle:title detail:detail cancelButton:ccBtnTitle comfirmButton:cfmBtnTitle otherButtons:others block:block];
}

- (id)initWithtitle:(NSString *)title
             detail:(NSString *)detail
       cancelButton:(NSString *)ccBtnTitle
      comfirmButton:(NSString *)cfmBtnTitle
       otherButtons:(NSArray<NSString *> *)others
              block:(alertBlock)block {
    if (self = [super init]) {
        self.alertTitle = title;
        self.detail = detail;
        self.cancelButtonTitle = ccBtnTitle;
        self.comfirmButtonTitle = cfmBtnTitle;
        self.otherButtonTitles = others;
        _block = [block copy];
    }
    return self;
}

- (void)setup {
    
}

- (void)showInMainWindow {
    
}

- (void)showInViewController:(UIViewController *)vc {
    
}

- (void)dismiss {
    
}

@end

