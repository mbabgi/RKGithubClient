//
//  RKGithubCMappingProvider.m
//  RKGithubClient
//
//  Created by Mosab Khaled on 5/30/12.
//  Copyright (c) 2012 mbabgi@me.com. All rights reserved.
//

#import "RKGithubCMappingProvider.h"
#import "Issue.h"
#import "User.h"

@implementation RKGithubCMappingProvider

@synthesize objectStore;

+ (id)mappingProviderWithObjectStore:(RKManagedObjectStore *)objectStore {
    return [[self alloc] initWithObjectStore:objectStore];    
}

- (id)initWithObjectStore:(RKManagedObjectStore *)theObjectStore
{
    self = [super init];
    
    if (self) 
    {
        self.objectStore = theObjectStore;
        
        [self setObjectMapping:[self issueObjectMapping] forResourcePathPattern:@"repos/:user/:repo/issues" withFetchRequestBlock:^NSFetchRequest *(NSString* resourcePath) 
         {
             NSFetchRequest *fetchRequest = [Issue fetchRequest];
             fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
             return fetchRequest;
         }         
         ];
    }
    return self;
}

-(RKManagedObjectMapping*)issueObjectMapping
{
    RKManagedObjectMapping *issueMapping = [RKManagedObjectMapping mappingForClass:[Issue class]];
    [issueMapping mapKeyPath:@"body" toAttribute:@"body"];
    [issueMapping mapKeyPath:@"id" toAttribute:@"issueId"];
    [issueMapping mapKeyPath:@"state" toAttribute:@"state"];
    [issueMapping mapKeyPath:@"title" toAttribute:@"title"];
    [issueMapping mapKeyPath:@"updated_at" toAttribute:@"updatedAt"];
    
    // Relationship
    [issueMapping mapKeyPath:@"user" toRelationship:@"assignee" withMapping:[self userObjectMapping]];
    
    return issueMapping;
}

-(RKManagedObjectMapping*)userObjectMapping
{
    RKManagedObjectMapping *userMapping = [RKManagedObjectMapping mappingForClass:[User class]];
    [userMapping mapKeyPath:@"gravatar_id" toAttribute:@"avatarURL"];
    [userMapping mapKeyPath:@"id" toAttribute:@"issueId"];
    [userMapping mapKeyPath:@"login" toAttribute:@"login"];
    
    return userMapping;
}


@end
