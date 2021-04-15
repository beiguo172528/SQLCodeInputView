//
//  Utils.m
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/14.
//

#import "Utils.h"

@implementation Utils
//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIViewController *)getControllerFromView:(UIView*)pView{
    for (UIView *pNext = [pView superview]; pNext; pNext = pNext.superview) {
        UIResponder *pNextResponder = [pNext nextResponder];
        if ([pNextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)pNextResponder;
        }
    }
    return nil;
}

+ (NSArray*)subStringForLetter:(NSString*)text{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < text.length; i++) {
        NSString *str = [text substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:str];
    }
    return arr;
}
@end
