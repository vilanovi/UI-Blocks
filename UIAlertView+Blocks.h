//
//  UIAlertView+Blocks.h
//  Copyright (c) 2013 Joan Martin. All rights reserved.
//

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
