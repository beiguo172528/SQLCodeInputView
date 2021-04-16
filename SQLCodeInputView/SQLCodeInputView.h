//
//  SQLCodeInputView.h
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SQLCodeInputViewDelegate <NSObject>

- (void)getCodeString:(NSString*)str;

@end

@interface SQLCodeInputView : UIView
@property (nonatomic, weak) id<SQLCodeInputViewDelegate> delegate;
- (instancetype)initWithCodeNum:(int)num withShow16P:(BOOL)isShow16P;
- (void)loadView;//addSubview 后调用
- (void)setShow16P:(BOOL)isShow16P;
- (void)reloadCodeView;
@end

NS_ASSUME_NONNULL_END
