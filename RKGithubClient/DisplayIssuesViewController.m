//
//  DisplayIssuesViewController.m
//  RKGithubClient
//
//  Created by Mosab Khaled on 5/29/12.
//  Copyright (c) 2012 mbabgi@me.com. All rights reserved.
//
#import <RestKit/RestKit.h>
#import <RestKit/UI.h>
//#import <CoreData/CoreData.h>
#import "Issue.h"
#import "User.h"
#import "DisplayIssuesViewController.h"

@interface DisplayIssuesViewController ()
@property (nonatomic, retain) RKFetchedResultsTableController *fetchRequestTC;
@end

@implementation DisplayIssuesViewController

@synthesize fetchRequestTC;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.fetchRequestTC = [[RKObjectManager sharedManager] fetchedResultsTableControllerForTableViewController:self];
    self.fetchRequestTC.autoRefreshFromNetwork = YES;
    //self.fetchRequestTC.pullToRefreshEnabled = YES;
    self.fetchRequestTC.resourcePath = @"/repos/RestKit/RestKit/issues";
    self.fetchRequestTC.variableHeightRows = YES;
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"updatedAt" ascending:YES];
    self.fetchRequestTC.sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    RKTableViewCellMapping *cellMapping = [RKTableViewCellMapping cellMapping];
    cellMapping.reuseIdentifier = @"Issue";
    cellMapping.rowHeight = 80.0;
    [cellMapping mapKeyPath:@"title" toAttribute:@"titleLabel.text"];
    
    [fetchRequestTC mapObjectsWithClass:[Issue class] toTableCellsWithMapping:cellMapping];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [fetchRequestTC loadTable];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
