//
//  Utils.h
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/14.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define RGBA(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]



@interface Utils : NSObject
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIViewController *)getControllerFromView:(UIView*)pView;
+ (NSArray*)subStringForLetter:(NSString*)text;
@end

NS_ASSUME_NONNULL_END
