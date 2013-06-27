//
//  UIActionSheet+Blocks.h
//  Copyright (c) 2012 Joan Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIActionSheetCompletionBlock)(UIActionSheet *actionSheet, NSInteger buttonIndex);

@interface UIActionSheet (Blocks) <UIActionSheetDelegate>

- (id)initWithTitle:(NSString*)title
        delegate:(id<UIActionSheetDelegate>)delegate
       cancelButton:(NSString*)cancelButton
  destructiveButton:(NSString*)destructiveButton
       otherButtons:(NSArray*)otherButtons;

- (void)showInView:(UIView *)view completionBlock:(UIActionSheetCompletionBlock)block;
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionBlock:(UIActionSheetCompletionBlock)block;
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionBlock:(UIActionSheetCompletionBlock)block;
- (void)showFromTabBar:(UITabBar *)view completionBlock:(UIActionSheetCompletionBlock)block;
- (void)showFromToolbar:(UIToolbar *)view completionBlock:(UIActionSheetCompletionBlock)block;

@end
