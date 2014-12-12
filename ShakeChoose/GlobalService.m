//
//  GlobalService.m
//  ShakeChoose
//
//  Created by Zzy on 8/25/14.
//  Copyright (c) 2014 Duobei Brothers. All rights reserved.
//

#import "GlobalService.h"
#import "Food.h"
#import "FileUtils.h"

static NSString *const FOOD_FILE = @"FoodFile";
static NSString *const FOOD_HISTORY_FILE = @"FoodHistoryFile";

@interface GlobalService ()
@property (strong, nonatomic, readwrite) NSArray *colorList;
@property (strong, nonatomic, readwrite) NSMutableArray *foodList;
@property (strong, nonatomic, readwrite) NSMutableArray *foodHistoryList;
@property (strong, nonatomic, readwrite) UIColor *currentColor;
@end

@implementation GlobalService

+ (GlobalService *)sharedSingleton
{
    static GlobalService *sharedSingleton;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        if (!sharedSingleton) {
            sharedSingleton = [[GlobalService alloc] init];
        }
    });
    return sharedSingleton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.colorList = [[NSArray alloc] initWithObjects:
                      [UIColor colorWithRed:250 / 255.0f green:157 / 255.0f blue:28 / 255.0f alpha:1.0f],
                      [UIColor colorWithRed:76 / 255.0f green:182 / 255.0f blue:178 / 255.0f alpha:1.0f],
                      [UIColor colorWithRed:111 / 255.0f green:176 / 255.0f blue:127 / 255.0f alpha:1.0f],
                      [UIColor colorWithRed:219 / 255.0f green:99 / 255.0f blue:79 / 255.0f alpha:1.0f],
                      nil];
        self.currentColor = [UIColor colorWithRed:219 / 255.0f green:99 / 255.0f blue:79 / 255.0f alpha:1.0f];
        self.foodList = [[NSMutableArray alloc] init];
        self.foodHistoryList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)insertFood:(Food *)food
{
    [self.foodList addObject:food];
    [self backupToFile];
}

- (void)deleteFoodAtIndex:(NSInteger)index
{
    [self.foodList removeObjectAtIndex:index];
    [self backupToFile];
}

- (void)inserFoodHistory:(FoodHistory *)foodHistory
{
    [self.foodHistoryList addObject:foodHistory];
    [self backupToFile];
}

- (void)backupToFile
{
    [NSKeyedArchiver archiveRootObject:self.foodList toFile:[self documentPathWithFileName:FOOD_FILE]];
    [NSKeyedArchiver archiveRootObject:self.foodHistoryList toFile:[self documentPathWithFileName:FOOD_HISTORY_FILE]];
}

- (void)recoverFromFile
{
    NSArray *tempFoodArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self documentPathWithFileName:FOOD_FILE]];
    if (tempFoodArray) {
        self.foodList = [tempFoodArray mutableCopy];
    }
    NSArray *tempFoodHistoryArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self documentPathWithFileName:FOOD_HISTORY_FILE]];
    if (tempFoodHistoryArray) {
        self.foodHistoryList = [tempFoodHistoryArray mutableCopy];
    }
}

- (Food *)getRandomFood
{
    if (self.foodList.count) {
        NSInteger index = arc4random() % self.foodList.count;
        return [self.foodList objectAtIndex:index];
    }
    return nil;
}

- (UIColor *)getRandomColor
{
    NSInteger index = arc4random() % self.colorList.count;
    self.currentColor = [self.colorList objectAtIndex:index];
    return self.currentColor;
}

- (NSString *)documentPathWithFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *filePath = [basePath stringByAppendingString:[NSString stringWithFormat:@"/%@", fileName]];
    return filePath;
}

@end
