//
//  SQLInputButton.m
//  SQLCodeInputView
//
//  Created by DOFAR on 2021/4/14.
//

#import "Utils.h"
#import "SQLInputButton.h"

@implementation SQLInputButton

- (void)awakeFromNib{
    [super awakeFromNib];
    [self changeView];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self changeView];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self changeView];
    return self;
}

- (void)changeView{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10;
    self.titleLabel.font = [UIFont systemFontOfSize:27.0];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self setTitleColor:[UIColor colorWithRed:69.0f/255.0f green:197.0f/255.0f blue:243.0f/255.0f alpha:1.0f] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[Utils imageWithColor:RGBA(69.0,204.0,239.0,0.09)] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)color{
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = 32;
    CGFloat imageH = 23;
    CGFloat imageX = (contentRect.size.width-imageW) * 0.5;
    CGFloat imageY = (contentRect.size.height-imageH) * 0.5;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
