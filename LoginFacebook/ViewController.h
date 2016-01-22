//
//  ViewController.h
//  LoginFacebook
//
//  Created by PROIMA on 24/9/15.
//  Copyright © 2015 PROIMA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController : UIViewController<FBSDKLoginButtonDelegate> {
	
}

@property (strong, nonatomic) IBOutlet FBSDKLoginButton *fbLoginBtn;
@property (strong, nonatomic) IBOutlet UITextView *textoFacebook;

@end