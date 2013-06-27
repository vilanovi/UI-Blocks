//
//  UIAlertView+Blocks.h
//  Copyright (c) 2013 Joan Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIAlertViewCompletionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (Blocks) <UIAlertViewDelegate>

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           delegate:(id<UIAlertViewDelegate>)delegate
       cancelButton:(NSString *)cancelButtonTitle
       otherButtons:(NSArray*)otherButtonTitles;

- (void)showWithCompletionBlock:(UIAlertViewCompletionBlock)completionBlock;

@end
