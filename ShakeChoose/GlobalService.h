//
//  GlobalService.h
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Food;
@class FoodHistory;

@interface GlobalService : NSObject
@property (strong, readonly, nonatomic) NSArray *colorList;
@property (strong, readonly, nonatomic) NSMutableArray *foodList;
@property (strong, readonly, nonatomic) NSMutableArray *foodHistoryList;
@property (strong, readonly, nonatomic) UIColor *currentColor;

+ (GlobalService *)sharedSingleton;

- (void)insertFood:(Food *)food;
- (void)deleteFoodAtIndex:(NSInteger)index;

- (void)inserFoodHistory:(FoodHistory *)foodHistory;

- (void)backupToFile;
- (void)recoverFromFile;

- (Food *)getRandomFood;
- (UIColor *)getRandomColor;

@end
