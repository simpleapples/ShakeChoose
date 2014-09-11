//
//  Food.h
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (copy, readonly, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
