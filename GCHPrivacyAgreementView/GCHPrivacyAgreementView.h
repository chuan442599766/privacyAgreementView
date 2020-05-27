//
//  ZXPrivacyAgreementView.h
//  GCHPrivacyAgreementView
//
//  Created by GCH on 2020/5/8.
//  Copyright © 2020 cn.hdcb.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GCHPrivacyAgreementView;

@protocol GCHPrivacyAgreementDelegate <NSObject>

-(void)clickButton:(NSInteger)buttonIndex
          withView:(GCHPrivacyAgreementView*)privacyAgreementView;
-(void)clickPrivacyAgreement;

@end

@interface GCHPrivacyAgreementView : UIView

@property (nonatomic, weak) id<GCHPrivacyAgreementDelegate>PAdelegate;
@property (nonatomic, strong) NSArray *dataArray;
-(void)showPrivacyAgreementView:(UIView*)view;
-(void)hiddenPrivacyAgreementView;

@end

NS_ASSUME_NONNULL_END
