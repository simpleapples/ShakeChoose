//
//  HistoryItem.m
//  ShakeChoose
//
//  Created by Zzy on 9/11/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "FoodHistory.h"

@interface FoodHistory ()<NSCoding>
@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *createTime;
@end

@implementation FoodHistory

- (id)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must use initWithName:createTime: instead." userInfo:nil];
}

- (instancetype)initWithName:(NSString *)name createTime:(NSDate *)createTime
{
    self = [super init];
    if (self) {
        self.name = name;
        self.createTime = createTime;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSString *name = [aDecoder decodeObjectForKey:@"name"];
    NSDate *createTime = [aDecoder decodeObjectForKey:@"createTime"];
    return [self initWithName:name createTime:createTime];
}

@end
