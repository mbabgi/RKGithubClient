//
//  RKGithubCMappingProvider.h
//  RKGithubClient
//
//  Created by Mosab Khaled on 5/30/12.
//  Copyright (c) 2012 mbabgi@me.com. All rights reserved.
//

#import <RestKit/RestKit.h>
#import <RestKit/CoreData.h>

@interface RKGithubCMappingProvider : RKObjectMappingProvider

@property (nonatomic, strong) RKManagedObjectStore *objectStore;

+ (id)mappingProviderWithObjectStore:(RKManagedObjectStore *)objectStore;


- (id)initWithObjectStore:(RKManagedObjectStore *)objectStore;

-(RKManagedObjectMapping*)issueObjectMapping;
-(RKManagedObjectMapping*)userObjectMapping;


@end
