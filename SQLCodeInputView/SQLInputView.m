//
//  SQLInputView.m
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/14.
//

#import "Utils.h"
#import "SQLInputView.h"
#import <Masonry/Masonry.h>

@interface SQLInputView(){
    int num;
    NSMutableArray *labels;
}
@end

@implementation SQLInputView

- (void)setLabelNum:(int)num{
    self->num = num;
    self->labels = [NSMutableArray array];
    [self createLabels];
}

- (void)createLabels{
    NSMutableArray *views = [NSMutableArray array];
    for (int i = 0; i < self->num; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:view];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
        label.font = [UIFont systemFontOfSize:24.0];
        label.textColor = [UIColor whiteColor];
        label.text = @"";
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        UIView *line = [[UIView alloc]initWithFrame:CGRectZero];
        line.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1.0f];
        [view addSubview:line];
        [views addObject:view];
        [self->labels addObject:label];
    }
    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:80 tailSpacing:80];
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    for (int i = 0; i < views.count; i++) {
        UIView *view = views[i];
        UILabel *label = view.subviews[0];
        UIView *line = view.subviews[1];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view);
            make.right.equalTo(view);
            make.bottom.equalTo(view);
            make.height.equalTo(@(1));
        }];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view);
            make.right.equalTo(view);
            make.top.equalTo(view);
            make.bottom.equalTo(line.mas_top);
        }];
    }
}

- (void)setLabelStr:(NSString*)str{
    NSArray *arr = [Utils subStringForLetter:str];
    [self->labels enumerateObjectsUsingBlock:^(UILabel*  _Nonnull label, NSUInteger idx, BOOL * _Nonnull stop) {
        label.text = @"";
    }];
    for (int i = 0; i < MIN(self->labels.count, arr.count); i++) {
        UILabel *label = self->labels[i];
        label.text = arr[i];
    }
}

@end
