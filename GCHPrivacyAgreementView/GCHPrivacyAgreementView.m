//
//  GCHPrivacyAgreementView
//
//  Created by GCH on 2020/5/8.
//  Copyright © 2020 cn.hdcb.com. All rights reserved.
//

#import "GCHPrivacyAgreementView.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "UIColor+Hex.h"
@interface GCHPrivacyAgreementView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *customTableview;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation GCHPrivacyAgreementView

#define contentViewHeigh  332
#define contentViewMargin 53

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor colorWithHexString:@"#000000"] colorWithAlphaComponent:0.3];
        self.dataArray =@[@"感谢您使用***。根据我国网络信息安全相关法律法规的要求，我行制定了《***有限公司隐私政策》，对使用过程中可能出现的个人信息收集、使用、共享和保护等情况进行说明。为了您更好地了解并使用相关服务，请在使用前认真阅读完整版隐私政策。您需确认同意后方可使用***。我公司将尽全力保护您的个人信息安全。"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [super encodeWithCoder:coder];
    self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.5];
    
}

-(void)showPrivacyAgreementView:(UIView*)view{
    [view addSubview:self];
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.customTableview];
    [self addButton];
}
-(void)hiddenPrivacyAgreementView{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdtifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdtifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdtifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        cell.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        
    }
    cell.textLabel.attributedText = [self getAttributeWith:@[@"《***有限公司隐私政策》"] string:self.dataArray[0] orginFont:14 orginColor:[UIColor colorWithHexString:@"#666666"] attributeFont:14 attributeColor:[UIColor colorWithHexString:@"#C41A22"]];

    __weak typeof(self)weakSelf = self;
    cell.textLabel.enabledTapEffect = YES;
    [cell.textLabel yb_addAttributeTapActionWithStrings:@[@"《***有限公司隐私政策》"] tapClicked:^(UILabel *label, NSString *string, NSRange range, NSInteger index) {
        NSLog(@"1111");
        if ([weakSelf.PAdelegate respondsToSelector:@selector(clickPrivacyAgreement)]) {
            [weakSelf.PAdelegate clickPrivacyAgreement];
        }
    }];

    
    return cell;
    
}

- (UIView*)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(contentViewMargin, 0, self.bounds.size.width - contentViewMargin*2, contentViewHeigh)];
        _contentView.center = self.center;
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 10;
    }
    return _contentView;
}

- (UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 26.3, self.contentView.bounds.size.width, 22)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
        _titleLabel.text = @"隐私服务协议";
    }
    return _titleLabel;
}

- (UITableView *)customTableview{
    if (!_customTableview) {
        _customTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)+10, self.contentView.bounds.size.width, contentViewHeigh - CGRectGetMaxY(self.titleLabel.frame) - 19 - 45 ) style:UITableViewStylePlain];
        _customTableview.layer.cornerRadius = 10;
        _customTableview.rowHeight = UITableViewAutomaticDimension;
        _customTableview.separatorColor = [UIColor clearColor];
        _customTableview.tableFooterView = [UIView new];
        _customTableview.tableHeaderView = [UIView new];
        _customTableview.delegate = self;
        _customTableview.dataSource = self;
    }
    return _customTableview;
}

- (void)addButton{
    
    CGFloat buttonWidth = self.contentView.bounds.size.width / 2;
    CGFloat buttonHeight = 44;
    CGFloat originY =  self.contentView.bounds.size.height - buttonHeight;
    
    for (int i =0; i<2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(i*buttonWidth,originY, buttonWidth, buttonHeight);
        button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+i;
        if (i == 0) {
            [button setTitleColor:[UIColor colorWithHexString:@"#C41A22"] forState:UIControlStateNormal];
            [button setTitle:@"同意" forState:UIControlStateNormal];
        }else{
            [button setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
            [button setTitle:@"暂不同意" forState:UIControlStateNormal];
            
        }
        [self.contentView addSubview:button];
        
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, originY, self.contentView.bounds.size.width, 0.5)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#DFDFDF"];
    [self.contentView addSubview:lineView];
    
    UIView *middleView = [[UIView alloc] initWithFrame:CGRectMake(self.contentView.bounds.size.width / 2, originY, 0.5, buttonHeight)];
    middleView.backgroundColor = [UIColor colorWithHexString:@"#DFDFDF"];
    [self.contentView addSubview:middleView];
    
    
}

- (void)buttonClick:(UIButton*)button{
    if ([self.PAdelegate respondsToSelector:@selector(clickButton:withView:)]) {
        [self.PAdelegate clickButton:button.tag withView:self];
    }
}

- (NSAttributedString *)getAttributeWith:(id)sender
                                  string:(NSString *)string
                               orginFont:(CGFloat)orginFont
                              orginColor:(UIColor *)orginColor
                           attributeFont:(CGFloat)attributeFont
                          attributeColor:(UIColor *)attributeColor
{
    __block  NSMutableAttributedString *totalStr = [[NSMutableAttributedString alloc] initWithString:string];
    [totalStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:orginFont] range:NSMakeRange(0, string.length)];
    [totalStr addAttribute:NSForegroundColorAttributeName value:orginColor range:NSMakeRange(0, string.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:3.0f]; //设置行间距
    paragraphStyle.firstLineHeadIndent=orginFont * 2;
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
    [totalStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalStr length])];
    
    if ([sender isKindOfClass:[NSArray class]]) {
        
        __block NSString *oringinStr = string;
        __weak typeof(self) weakSelf = self;
        
        [sender enumerateObjectsUsingBlock:^(NSString *  _Nonnull str, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSRange range = [oringinStr rangeOfString:str];
            [totalStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:attributeFont] range:range];
            [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColor range:range];
            oringinStr = [oringinStr stringByReplacingCharactersInRange:range withString:[weakSelf getStringWithRange:range]];
            
        }];
        
    }else if ([sender isKindOfClass:[NSString class]]) {
        
        NSRange range = [string rangeOfString:sender];
        
        [totalStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:attributeFont] range:range];
        [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColor range:range];
    }
    return totalStr;
}
- (NSString *)getStringWithRange:(NSRange)range
{
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < range.length ; i++) {
        [string appendString:@" "];
    }
    return string;
}

@end
