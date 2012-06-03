//
//  AppDelegate.h
//  RKGithubClient
//
//  Created by Mosab Khaled on 5/28/12.
//  Copyright (c) 2012 mbabgi@me.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@class ViewController;
@class DisplayIssuesViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) DisplayIssuesViewController *disIssueVC;

@property (readonly, strong, nonatomic) RKObjectManager *objectManager;
@property (readonly, strong, nonatomic) RKManagedObjectStore *objectStore;

           
@end
