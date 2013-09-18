//
//  UIActionSheet+Blocks.m
//  Copyright (c) 2012 Joan Martin. All rights reserved.
//
// Copyright (c) 2013 Joan Martin, vilanovi@gmail.com.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

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
            self.destructiveButtonIndex = 0;
        }
        
        for (NSString *button in otherButtons)
            [self addButtonWithTitle:button];
        
        if (cancelButton)
        {
            [self addButtonWithTitle:cancelButton];
            self.cancelButtonIndex = self.numberOfButtons - 1;
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
