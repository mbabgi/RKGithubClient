//
//  AppDelegate.m
//  RKGithubClient
//
//  Created by Mosab Khaled on 5/28/12.
//  Copyright (c) 2012 mbabgi@me.com. All rights reserved.
//
#import <RestKit/RestKit.h>
#import <RestKit/CoreData.h>

#import "AppDelegate.h"
#import "RKGithubCMappingProvider.h"
#import "DisplayIssuesViewController.h"

#import "ViewController.h"

@interface AppDelegate()
@property (nonatomic, strong, readwrite) RKObjectManager *objectManager;
@property (nonatomic, strong, readwrite) RKManagedObjectStore *objectStore;
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize objectManager, objectStore;

- (void) initializeRestKit
{
    self.objectManager = [RKObjectManager managerWithBaseURLString:@"https://api.github.com/"];
    self.objectStore   = [RKManagedObjectStore objectStoreWithStoreFilename:@"RKGithubClient.sqlite"];
    self.objectManager.objectStore = self.objectStore;
    self.objectManager.mappingProvider = [RKGithubCMappingProvider mappingProviderWithObjectStore:self.objectStore];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self initializeRestKit];
    return YES;
    
    // Override point for customization after application launch.
   // self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
   // self.window.rootViewController = self.viewController;
    
    DisplayIssuesViewController *viewController = [[DisplayIssuesViewController alloc] init];
    self.window.rootViewController = viewController;
    
    [self.window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSError *error = nil;
    if (![self.objectStore save:&error]) 
    {
        RKLogError(@"RKLooog >> Error while saving into managed object store: %@", error);
        NSLog(@"NSLoooog >> Error while saving into managed object store: %@", error);
    }
}


// OPTIONAL METHODS << ignore it ;)
- (void)applicationWillResignActive:(UIApplication *)application
{}

- (void)applicationDidEnterBackground:(UIApplication *)application
{}

- (void)applicationWillEnterForeground:(UIApplication *)application
{}

- (void)applicationDidBecomeActive:(UIApplication *)application
{}


@end
