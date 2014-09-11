//
//  HistoryItem.h
//  ShakeChoose
//
//  Created by Zzy on 9/11/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodHistory : NSObject

@property (copy, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSDate *createTime;

- (instancetype)initWithName:(NSString *)name createTime:(NSDate *)createTime;

@end
