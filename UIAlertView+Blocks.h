//
//  UIAlertView+Blocks.h
//  Copyright (c) 2013 Joan Martin. All rights reserved.
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

#import <UIKit/UIKit.h>

/*!
 * AlertView completion block type.
 * The completion block contains the following parameters:
 * @param alertView The invloved alert view.
 * @param buttonIndex The selected button index.
 */
typedef void (^UIAlertViewCompletionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

/*!
 * This category adds support for completion blocks in the 'show' methods of alert view.
 */
@interface UIAlertView (Blocks) <UIAlertViewDelegate>

/*!
 * Initialize an alert view.
 * @param title The alert view's title.
 * @param message The alert view's message.
 * @param delegate Alert view's delegate receiver.
 * @param cancelButtonTitle Title for the cancel button.
 * @param otherButtonTitless Array with titles for other buttons.
 * @return The initialized instance.
 */
- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           delegate:(id<UIAlertViewDelegate>)delegate
       cancelButton:(NSString *)cancelButtonTitle
       otherButtons:(NSArray*)otherButtonTitles;

/*!
 * Use this method to show the alert view if you want to handle the response using a completion block.
 * @param completionBlock The completion block.
 */
- (void)showWithCompletionBlock:(UIAlertViewCompletionBlock)completionBlock;

@end
