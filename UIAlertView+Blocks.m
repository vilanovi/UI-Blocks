//
//  UIAlertView+Blocks.m
//  Copyright (c) 2012 Joan Martin. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

static NSString *kUIAlertViewCompletionBlockKey = @"kUIAlertViewCompletionBlockKey";

@implementation UIAlertView (Blocks)

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           delegate:(id<UIAlertViewDelegate>)delegate
       cancelButton:(NSString *)cancelButtonTitle
       otherButtons:(NSArray*)otherButtonTitles
{
    self = [self initWithTitle:title
                        message:message
                       delegate:delegate
              cancelButtonTitle:cancelButtonTitle
              otherButtonTitles:nil];
    
    if (self)
    {
        for (NSString *buttonTitle in otherButtonTitles)
            [self addButtonWithTitle:buttonTitle];
    }
    return self;
}

- (void)showWithCompletionBlock:(UIAlertViewCompletionBlock)block
{
    objc_setAssociatedObject(self, (__bridge const void *)(kUIAlertViewCompletionBlockKey), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegate = self;
    
    [self show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertViewCompletionBlock completionBlock = objc_getAssociatedObject(self, (__bridge const void *)(kUIAlertViewCompletionBlockKey));
    
    if (completionBlock != nil)
        completionBlock(alertView, buttonIndex);
    
    objc_setAssociatedObject(self, (__bridge const void *)(kUIAlertViewCompletionBlockKey), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
