//
//  ViewController.m
//  LoginFacebook
//
//  Created by PROIMA on 24/9/15.
//  Copyright © 2015 PROIMA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textoFacebook, fbLoginBtn;


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) loadView {
    [super loadView];
    
    fbLoginBtn = [[FBSDKLoginButton alloc] init];
    fbLoginBtn.delegate = self;
    fbLoginBtn.center = self.view.center;
    fbLoginBtn.loginBehavior = FBSDKLoginBehaviorBrowser;
    fbLoginBtn.readPermissions = @[@"public_profile", @"email"];
    [fbLoginBtn setTitle:@"Inicia con Facebook" forState:UIControlStateNormal];
    [self.view addSubview:fbLoginBtn];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(BOOL) sesionIniciadaEnFacebook {
	
	if ([FBSDKAccessToken currentAccessToken]) {
		NSLog(@"Está logueado");
		return  TRUE;
	} else {
		NSLog(@"No está logueado");
		return FALSE;
	}
	
}

- (BOOL) loginButtonWillLogin:(FBSDKLoginButton *)loginButton {
	
	NSLog(@"loginButtonWillLogin de Facebook");
	textoFacebook.text = @"loginButtonWillLogin de Facebook";
	NSLog(@"Read-Perms: %@", loginButton.readPermissions);
	return true;
	
}

-(void)
loginButton:	(FBSDKLoginButton *)loginButton
didCompleteWithResult:	(FBSDKLoginManagerLoginResult *)result
error:	(NSError *)error{
	
	NSLog(@"loginButton de Facebook");
    
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"id,name,email" forKey:@"fields"];
	
	if ([FBSDKAccessToken currentAccessToken]) {
		[[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
		 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
			 if (!error) {
				 NSLog(@"fetched user:%@", result);
				 NSLog(@"name:%@", [result valueForKey:@"name"]);
				 NSLog(@"id:%@", [result valueForKey:@"id"]);
				 NSLog(@"email:%@", [result valueForKey:@"email"]);
			 }
		 }];
	}
	
	
	
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
	
	NSLog(@"loginButtonDidLogOut de Facebook");
	
}

@end