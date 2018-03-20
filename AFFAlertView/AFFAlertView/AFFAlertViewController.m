//
//  AFFAlertViewController.m
//  AFFAlertView
//
//  Created by xuying on 2018/3/15.
//  Copyright © 2018年 Mystic-Liu. All rights reserved.
//

#define key_vc  "com.alert.vc"

#import "AFFAlertViewController.h"
#import <objc/runtime.h>

@interface AFFAlertViewController () {
    alertBlock _block;
    UIWindow *_window;
}

@property (nonatomic, copy) NSString *alertTitle;

@property (nonatomic, copy) NSString *detail;

@property (nonatomic, copy) NSString *cancelButtonTitle;

@property (nonatomic, copy) NSString *comfirmButtonTitle;

@property (nonatomic, copy) NSArray<NSString *> *otherButtonTitles;

@property (nonatomic, weak) UIViewController *showingVC;

@property (nonatomic, weak) UIView *alertContentView;

@end

@implementation AFFAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

+ (AFFAlertViewController *)alertWithtitle:(NSString *)title
                                    detail:(NSString *)detail
                              cancelButton:(NSString *)ccBtnTitle
                             comfirmButton:(nonnull NSString *)cfmBtnTitle
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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    self.alertContentView = view;
    
    CGFloat height = 0;
    
    if (self.alertTitle.length > 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, height, 260, 20)];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = self.alertTitle;
        [view addSubview:label];
        
        height += 20;
    }
    if (self.detail.length > 0) {
        CGSize size = [self.detail sizeWithFont:[UIFont systemFontOfSize:13] forWidth:230 lineBreakMode:NSLineBreakByWordWrapping];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, height, 230, size.height)];
        label.numberOfLines = 0;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.text = self.detail;
        [view addSubview:label];
        
        height += size.height;
    }
    BOOL hasMore = self.otherButtonTitles.count > 0;
    if (hasMore) {
        
    }
}

- (void)showInMainWindow {
    if (!_window) {
        _window = [UIApplication sharedApplication].keyWindow;
    }
    
    [_window addSubview:self.view];
    objc_setAssociatedObject(_window, key_vc, self, OBJC_ASSOCIATION_RETAIN);
    self.view.alpha = 0;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 1;
    }];
}

- (void)showInViewController:(UIViewController *)vc {
    self.showingVC = vc;
    
    [vc.view addSubview:self.view];
    self.view.alpha = 0;
    
    [vc addChildViewController:self];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 1;
    }];
}

- (void)dismiss {
    if (self.showingVC) {
        [UIView animateWithDuration:0.2 animations:^{
            self.view.alpha = 0;
        } completion:^(BOOL finished) {
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.view.alpha = 0;
        } completion:^(BOOL finished) {
            [self.view removeFromSuperview];
            
            objc_setAssociatedObject(_window, key_vc, nil, OBJC_ASSOCIATION_RETAIN);
        }];
    }
}

@end

