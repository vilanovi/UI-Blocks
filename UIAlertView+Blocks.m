//
//  UIAlertView+Blocks.m
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
