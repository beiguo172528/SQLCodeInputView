//
//  SQLCodeInputView.m
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/15.
//

#import "SQLCodeInputView.h"
#import "SQLInputView.h"
#import "SQLBtnsView.h"
#import "Utils.h"

@interface SQLCodeInputView()<SQLBtnsViewDelegate>{
    int num;
    NSString *labelStr;
    BOOL isShow16P;
}
@property(nonatomic, strong)SQLInputView *inputView;
@property(nonatomic, strong)SQLBtnsView *btnsView;
@end

@implementation SQLCodeInputView

- (instancetype)initWithCodeNum:(int)num withShow16P:(BOOL)isShow16P{
    self = [super init];
    if (self) {
        self->num = num;
        self->isShow16P = isShow16P;
    }
    return self;
}

- (void)loadView{
    UIViewController *vc = [Utils getControllerFromView:self];
    self.inputView = [[SQLInputView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.btnsView = [[SQLBtnsView alloc]initWithShow16P:self->isShow16P];
    [self addSubview:self.inputView];
    [vc.view addSubview:self.btnsView];
    [self.btnsView loadView];
    self.btnsView.delegate = self;
    self.inputView.userInteractionEnabled = true;
//    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(startInput)];
//    [self.inputView addGestureRecognizer:gr];
    [self.inputView setLabelNum:self->num];
    self->labelStr = @"";
    [self performSelector:@selector(startInput) withObject:nil afterDelay:0.5];
}

- (void)startInput{
    if(!self.btnsView.isShow){
        [self.btnsView setShow:true];
    }
}

- (void)setShow16P:(BOOL)isShow16P{
    self->isShow16P = isShow16P;
    [self.btnsView setShow16P:isShow16P];
}

- (void)choiceNumStr:(NSString *)str{
    self->labelStr = [NSString stringWithFormat:@"%@%@",self->labelStr,str];
    [self.inputView setLabelStr:self->labelStr];
    if (self->labelStr.length == self->num) {
        [self.btnsView setShow:false];
        if (self.delegate && [self.delegate respondsToSelector:@selector(getCodeString:)]) {
            [self.delegate getCodeString:self->labelStr];
        }
    }
}

- (void)choiceBack{
    if (self->labelStr.length > 0) {
        self->labelStr = [self->labelStr substringToIndex:self->labelStr.length-1];
    }
    [self.inputView setLabelStr:self->labelStr];
}

- (void)reloadCodeView{
    self->labelStr = @"";
    [self.inputView setLabelStr:self->labelStr];
    [self performSelector:@selector(startInput) withObject:nil afterDelay:0.5];
}

@end
