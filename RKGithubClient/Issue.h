//
//  Issue.h
//  RKGithubClient
//
//  Created by Mosab Khaled on 5/29/12.
//  Copyright (c) 2012 mbabgi@me.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Issue : NSManagedObject

@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSNumber * issueId;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) User *assignee;

@end
