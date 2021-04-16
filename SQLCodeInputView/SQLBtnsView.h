//
//  SQLBtnsView.h
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SQLBtnsViewDelegate <NSObject>

- (void)choiceNumStr:(NSString*)str;
- (void)choiceBack;

@end

@interface SQLBtnsView : UIView
@property(nonatomic, weak) id<SQLBtnsViewDelegate> delegate;
@property(nonatomic, assign) BOOL isShow;
@property(nonatomic, assign) BOOL isShow16P;
- (instancetype)initWithShow16P:(BOOL)isShow16P;
- (void)setShow16P:(BOOL)isShow16P;
- (void)setShow:(BOOL)isShow;
- (void)loadView;
@end

NS_ASSUME_NONNULL_END
