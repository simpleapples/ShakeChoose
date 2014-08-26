//
//  Food.m
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "Food.h"

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

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    return [self initWithName:[dictionary objectForKey:@"name"]];
}

- (NSDictionary *)dictionaryValue
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:_name, @"name", nil];
    return dict;
}

@end
