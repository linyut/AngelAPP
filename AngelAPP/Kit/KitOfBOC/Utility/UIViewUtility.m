//
//  UIViewUtility.m
//  PBPS-MA
//
//  Created by tk on 2017/1/4.
//  Copyright © 2017年 BOC_ezdb. All rights reserved.
//

#import "UIViewUtility.h"

@implementation UIViewUtility

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (BOOL)canReplaceString:(NSString*)string withTextField:(UITextField*)textField withLimitedLength:(NSInteger)limitedLength {
    NSInteger markedLength = [textField offsetFromPosition:textField.markedTextRange.start toPosition:textField.markedTextRange.end];
    NSInteger confirmLength = textField.text.length - markedLength;
    
    if (confirmLength >= limitedLength) {
        if (string.length == 0) {
            return YES;
        }
        else {
            return NO;
        }
    }
    
    return YES;
}

+ (BOOL)canReplaceString:(NSString*)string withTextView:(UITextView*)textView withLimitedLength:(NSInteger)limitedLength {
    NSInteger markedLength = [textView offsetFromPosition:textView.markedTextRange.start toPosition:textView.markedTextRange.end];
    NSInteger confirmLength = textView.text.length - markedLength;
    
    if (confirmLength >= limitedLength) {
        if (string.length == 0) {
            return YES;
        }
        else {
            return NO;
        }
    }
    
    return YES;
}

+ (void)trimTextField:(UITextField*)textField withLimitedLength:(NSInteger)limitedLength {
    if (!textField.markedTextRange) {
        if (textField.text.length > limitedLength) {
            NSRange range = [textField.text rangeOfComposedCharacterSequenceAtIndex:limitedLength-1];
            if (range.length > 1) {
                textField.text = [textField.text substringToIndex:range.location];
            }
            else {
                textField.text = [textField.text substringToIndex:limitedLength];
            }
        }
    }
}

+ (void)trimTextView:(UITextView*)textView withLimitedLength:(NSInteger)limitedLength {
    if (!textView.markedTextRange) {
        if (textView.text.length > limitedLength) {
            NSRange range = [textView.text rangeOfComposedCharacterSequenceAtIndex:limitedLength-1];
            if (range.length > 1) {
                textView.text = [textView.text substringToIndex:range.location];
            }
            else {
                textView.text = [textView.text substringToIndex:limitedLength];
            }
        }
    }
}

@end
