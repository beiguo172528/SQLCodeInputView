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
}
@property (nonatomic, strong) SQLCodeInputView *inputView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self->isShow16p = false;
    self.view.backgroundColor = [UIColor colorWithRed:69.0f/255.0 green:202.0f/255.0 blue:239.0f/255.0 alpha:0.5];
    self.inputView = [[SQLCodeInputView alloc]initWithCodeNum:9 withShow16P:self->isShow16p];
    self.inputView.frame = CGRectMake(0, 100, self.view.frame.size.width, 40);
    [self.view addSubview:self.inputView];
    [self.inputView loadView];
    self.inputView.delegate = self;
}

- (IBAction)onCLickBtn:(UIButton*)sender {
    [self.inputView setShow16P:!self->isShow16p];
    self->isShow16p = !self->isShow16p;
//    if (sender.tag == 100) {
//        [self.btnsView setShow:!self.btnsView.isShow];
//    }
//    else {
//        [self.btnsView setShow16P:!self.btnsView.isShow16P];
//    }
    
}

- (void)getCodeString:(NSString *)str{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(),^{
        [self.inputView reloadCodeView];
    });
}

@end
