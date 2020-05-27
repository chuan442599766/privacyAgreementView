//
//  ZXPrivacyAgreementView.h
//  GCHPrivacyAgreementView
//
//  Created by GCH on 2020/5/8.
//  Copyright © 2020 cn.hdcb.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZXPrivacyAgreementView;

@protocol ZXPrivacyAgreementDelegate <NSObject>

-(void)clickButton:(NSInteger)buttonIndex
          withView:(ZXPrivacyAgreementView*)privacyAgreementView;
-(void)clickPrivacyAgreement;

@end

@interface ZXPrivacyAgreementView : UIView

@property (nonatomic, weak) id<ZXPrivacyAgreementDelegate>PAdelegate;
@property (nonatomic, strong) NSArray *dataArray;
-(void)showPrivacyAgreementView:(UIView*)view;
-(void)hiddenPrivacyAgreementView;

@end

NS_ASSUME_NONNULL_END
