//
//  GlobalService.h
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Food;

@interface GlobalService : NSObject
{
    NSMutableArray *_foodList;
    NSArray *_colorList;
}

@property (strong, readonly, nonatomic) UIColor *currentColor;

+ (GlobalService *)sharedSingleton;

- (void)insertFood:(Food *)food;
- (Food *)foodAtIndex:(NSInteger)index;
- (void)deleteFoodAtIndex:(NSInteger)index;
- (NSInteger)foodListCount;

- (void)backupToFile;
- (void)recoverFromFile;

- (Food *)getRandomFood;
- (UIColor *)getRandomColor;

@end
