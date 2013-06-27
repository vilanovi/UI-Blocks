//
//  UIActionSheet+Blocks.m
//  Copyright (c) 2012 Joan Martin. All rights reserved.
//

#import "UIActionSheet+Blocks.h"
#import <objc/runtime.h>

static NSString *kUIActionSheetCompletionBlockKey = @"kUIActionSheetCompletionBlockKey";

@implementation UIActionSheet (Blocks)

- (id)initWithTitle:(NSString*)title
           delegate:(id<UIActionSheetDelegate>)delegate
       cancelButton:(NSString*)cancelButton
  destructiveButton:(NSString*)destructiveButton
       otherButtons:(NSArray*)otherButtons
{
    self = [self initWithTitle:title
                       delegate:delegate
              cancelButtonTitle:nil
         destructiveButtonTitle:nil
              otherButtonTitles:nil];
    if (self)
    {
        if (destructiveButton)
        {
            [self addButtonWithTitle:destructiveButton];
            [self setDestructiveButtonIndex:0];
        }
        
        for (NSString *button in otherButtons)
            [self addButtonWithTitle:button];
        
        if (cancelButton)
        {
            [self addButtonWithTitle:cancelButton];
            [self setCancelButtonIndex:self.numberOfButtons-1];
        }
    }
    return self;

}

- (void)showInView:(UIView *)view completionBlock:(UIActionSheetCompletionBlock)block
{
    objc_setAssociatedObject(self, (__bridge const void *)(kUIActionSheetCompletionBlockKey), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegate = self;
    [self showInView:view];
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionBlock:(UIActionSheetCompletionBlock)block
{
    objc_setAssociatedObject(self, (__bridge const void *)(kUIActionSheetCompletionBlockKey), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegate = self;
    [self showFromBarButtonItem:item animated:animated];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionBlock:(UIActionSheetCompletionBlock)block
{
    objc_setAssociatedObject(self, (__bridge const void *)(kUIActionSheetCompletionBlockKey), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegate = self;
    [self showFromRect:rect inView:view animated:animated];
}

- (void)showFromTabBar:(UITabBar *)view completionBlock:(UIActionSheetCompletionBlock)block
{
    objc_setAssociatedObject(self, (__bridge const void *)(kUIActionSheetCompletionBlockKey), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegate = self;
    [self showFromTabBar:view];
}

- (void)showFromToolbar:(UIToolbar *)view completionBlock:(UIActionSheetCompletionBlock)block
{
    objc_setAssociatedObject(self, (__bridge const void *)(kUIActionSheetCompletionBlockKey), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegate = self;
    [self showFromToolbar:view];
}

#pragma mark UIActionSheetDelegate

/*
 * Sent to the delegate when the user clicks a button on an action sheet.
 */
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{    
    UIActionSheetCompletionBlock completionBlock = objc_getAssociatedObject(self, (__bridge const void *)(kUIActionSheetCompletionBlockKey));
    
    if (completionBlock != nil)
        completionBlock(actionSheet, buttonIndex);
    
    objc_setAssociatedObject(self, (__bridge const void *)(kUIActionSheetCompletionBlockKey), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
