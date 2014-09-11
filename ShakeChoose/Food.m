//
//  Food.m
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "Food.h"

@interface Food ()<NSCoding>

@end

@implementation Food

- (id)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must use initWithName: instead." userInfo:nil];
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSString *name = [aDecoder decodeObjectForKey:@"name"];
    return [self initWithName:name];
}

@end
