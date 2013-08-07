//
//  UIActionSheet+Blocks.h
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

#import <UIKit/UIKit.h>

/*!
 * ActionSheet completion block type.
 * The completion block contains the following parameters:
 * @param actionSheet The invloved action sheet.
 * @param buttonIndex The selected button index.
 */
typedef void(^UIActionSheetCompletionBlock)(UIActionSheet *actionSheet, NSInteger buttonIndex);

/*!
 * This category adds support for completion blocks in the 'show' methods of action sheet.
 */
@interface UIActionSheet (Blocks) <UIActionSheetDelegate>

/*!
 * Initialize an action sheet.
 * @param title The action sheet title.
 * @param delegate Action sheet delegate receiver.
 * @param cancelButton Title for the cancel button.
 * @param destructiveButton Title for the destructive button.
 * @param otherButtons Array with titles for other buttons.
 * @return The initialized instance.
 */
- (id)initWithTitle:(NSString*)title
           delegate:(id<UIActionSheetDelegate>)delegate
       cancelButton:(NSString*)cancelButton
  destructiveButton:(NSString*)destructiveButton
       otherButtons:(NSArray*)otherButtons;

/*!
 * Call this method if you planned to call '-showInView:' method and you wanted to have a completion block.
 * @param view The view from which the action sheet originates.
 * @param block The completion block.
 */
- (void)showInView:(UIView *)view completionBlock:(UIActionSheetCompletionBlock)block;

/*!
 * Call this method if you planned to call '-showFromBarButtonItem:' method and you wanted to have a completion block.
 * @param item The bar button item from which the action sheet originates.
 * @param animated Specify YES to animate the presentation of the action sheet or NO to present it immediately without any animation effects.
 * @param block The completion block.
 */
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionBlock:(UIActionSheetCompletionBlock)block;

/*!
 * Call this method if you planned to call '-showFromRect:inView:animated:' method and you wanted to have a completion block.
 * @param rect The portion of view from which to originate the action sheet.
 * @param view The view from which to originate the action sheet.
 * @param animated Specify YES to animate the presentation of the action sheet or NO to present it immediately without any animation effects.
 * @param block The completion block.
 */
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionBlock:(UIActionSheetCompletionBlock)block;

/*!
 * Call this method if you planned to call '-showFromTabBar:' method and you wanted to have a completion block.
 * @param tabBar The tab bar from which the action sheet originates.
 * @param block The completion block.
 */
- (void)showFromTabBar:(UITabBar *)tabBar completionBlock:(UIActionSheetCompletionBlock)block;

/*!
 * Call this method if you planned to call '-showFromToolbar:' method and you wanted to have a completion block.
 * @param toolbar The toolbar from which the action sheet originates.
 * @param block The completion block.
 */
- (void)showFromToolbar:(UIToolbar *)toolbar completionBlock:(UIActionSheetCompletionBlock)block;

@end
