//
//  ViewController.m
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/14.
//

#import "ViewController.h"
#import "SQLCodeInputView.h"

@interface ViewController ()<SQLCodeInputViewDelegate>{
    BOOL isShow16p;
    int codeNum;
}
@property (nonatomic, strong) SQLCodeInputView *inputView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self->isShow16p = true;
    self->codeNum = 9;
    self.view.backgroundColor = [UIColor colorWithRed:69.0f/255.0 green:202.0f/255.0 blue:239.0f/255.0 alpha:0.5];
    self.inputView = [[SQLCodeInputView alloc]initWithCodeNum:self->codeNum withShow16P:self->isShow16p];
    self.inputView.frame = CGRectMake(0, 100, self.view.frame.size.width, 40);
    [self.view addSubview:self.inputView];
    [self.inputView loadView];
    self.inputView.delegate = self;
}

- (IBAction)onCLickBtn:(UIButton*)sender {
    self->codeNum = self->codeNum == 9 ? 5 : 9;
    [self.inputView setCodeNum:self->codeNum withShow16P:!self->isShow16p];
//    [self.inputView setShow16P:!self->isShow16p];
    self->isShow16p = !self->isShow16p;
}

- (void)getCodeString:(NSString *)str{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(),^{
        [self.inputView reloadCodeView];
    });
}

@end
