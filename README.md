# SQLCodeInputView

一、效果：

二、使用步骤：

1.pod
pod 'SQLCodeInputView'

2.import
#import "SQLCodeInputView.h"

3.一共有几为
self.inputView = [[SQLCodeInputView alloc]initWithCodeNum:9 withShow16P:true];

4.设置frame
self.inputView.frame = CGRectMake(0, 100, self.view.frame.size.width, 40);

5.addSubview
[self.view addSubview:self.inputView];

6.loadView（这一步是在addSubview后调用）
[self.inputView loadView];

7.delegate（输入完全后得到的字符串）
self.inputView.delegate = self;
- (void)getCodeString:(NSString *)str{}

链接：
GItHub：https://github.com/beiguo172528/SQLCodeInputView
简书：https://www.jianshu.com/p/321181e3fe28
