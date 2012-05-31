//
//  User.h
//  RKGithubClient
//
//  Created by Mosab Khaled on 5/29/12.
//  Copyright (c) 2012 mbabgi@me.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Issue;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSNumber * issueId;
@property (nonatomic, retain) NSString * avatarURL;
@property (nonatomic, retain) Issue *assignedIssue;

@end
