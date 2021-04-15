//
//  SQLBtnsView.m
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/14.
//

#import "Utils.h"
#import "SQLBtnsView.h"
#import "SQLInputButton.h"
#import <Masonry/Masonry.h>

#define kViewHeight 330

@interface SQLBtnsView(){
    NSMutableArray *btns;
    NSMutableArray *views;
}

@end

@implementation SQLBtnsView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.alpha = 0;
    }
    return self;
}

- (void)loadView{
    UIViewController *vc = [Utils getControllerFromView:self];
    self.frame = CGRectMake(0, vc.view.frame.size.height, vc.view.frame.size.width, kViewHeight);
    [self createView];
}

- (void)createView{
    UIViewController *vc = [Utils getControllerFromView:self];
    if (!vc) {
        return;
    }
    self->btns = [NSMutableArray array];
    self->views = [NSMutableArray array];
    int row = self.isShow16P ? 6 : 4;
    NSArray *arr = self.isShow16P ? @[@"A",@"B",@"C",@"D",@"E",@"F",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0",@"-"] : @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0",@"-"];
    
    for (int i = 0; i < row; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
        view.tag = 100 + i;
        [self addSubview:view];
        [self->views addObject:view];
        for (int j = 0; j < 3; j++) {
            UIView *v = NULL;
            if (![arr[i*3 + j] isEqualToString:@""]) {
                SQLInputButton * btn = [SQLInputButton buttonWithType:UIButtonTypeCustom];
                if(![arr[i*3 + j] isEqualToString:@"-"]){
                    [btn setTitle:arr[i*3 + j] forState:UIControlStateNormal];
                }
                else{
                    [btn setImage:[UIImage imageNamed:@"del.png"] forState:UIControlStateNormal];
                }
                if ((i*3 + j) < 6 && self.isShow16P) {
                    [btn setTitleColor:[UIColor colorWithRed:69.0f/255.0f green:237.0f/255.0f blue:216.0f/255.0f alpha:1.0f]];
                }
                [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
                v = btn;
            }
            else {
                v = [[UIView alloc]initWithFrame:CGRectZero];
            }
            v.tag = 200 + i * 3 + j;
            [view addSubview:v];
            [self->btns addObject:v];
        }
    }
    
    
    [self->views mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:0 leadSpacing:20 tailSpacing:20];
    [self->views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];
    for (int i = 0 ; i < self->views.count; i++) {
        UIView *view = self->views[i];
        [view.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:40 leadSpacing:20 tailSpacing:20];
        [view.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view);
            make.bottom.equalTo(view);
        }];
    }
    
}

- (void)setShow:(BOOL)isShow{
    self.isShow = isShow;
    if (self.isShow) {
        [self show];
    }
    else {
        [self hidden];
    }
}

- (void)show{
    self.alpha = 0;
    UIViewController *vc = [Utils getControllerFromView:self];
    self.frame = CGRectMake(0, vc.view.frame.size.height, vc.view.frame.size.width, kViewHeight);
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
        self.frame = CGRectMake(0, vc.view.frame.size.height - kViewHeight, vc.view.frame.size.width, kViewHeight);
        [self layoutIfNeeded];
    }];
}

- (void)hidden{
    self.alpha = 1;
    UIViewController *vc = [Utils getControllerFromView:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, vc.view.frame.size.height, vc.view.frame.size.width, kViewHeight);
        [self layoutIfNeeded];
    }];
}

- (void)setShow16P:(BOOL)isShow16P{
    if(self.isShow16P != isShow16P){
        self.isShow16P = isShow16P;
        [self setShow:false];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(),^{
            [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [self createView];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(),^{
                [self setShow:true];
            });
        });
    }
}

- (void)clickBtn:(UIButton*)btn{
    if(btn.titleLabel.text){
        if(self.delegate && [self.delegate respondsToSelector:@selector(choiceNumStr:)]){
            [self.delegate choiceNumStr:btn.titleLabel.text];
        }
    }
    else{
        if(self.delegate && [self.delegate respondsToSelector:@selector(choiceBack)]){
            [self.delegate choiceBack];
        }
    }
}

@end
