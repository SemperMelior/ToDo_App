//
//  ViewController.m
//  Todo
//
//  Created by Ian Lloyd Holmes on 12/3/15.
//  Copyright (c) 2015 Ian Lloyd Holmes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *loginControl;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation ViewController

- (IBAction)processLoginOrSignup:(id)sender {
    if ([self.loginControl selectedSegmentIndex] == 0) { // Log-in
        
    } else { // Sign-up
        [myRootRef createUser: email.text
                     password: password.text
     withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
         
         if (error) {
             // There was an error creating the account
         } else {
             NSString *uid = [result objectForKey:@"uid"];
             NSLog(@"Successfully created user account with uid: %@", uid);
         }
     }];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Create a reference to a Firebase database URL
    Firebase *myRootRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com"];
    // Write data to Firebase
    [myRootRef setValue:@"Do you have data? You'll love Firebase."];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
