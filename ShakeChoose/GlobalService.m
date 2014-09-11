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

@implementation GlobalService

+ (GlobalService *)sharedSingleton
{
    static GlobalService *sharedSingleton;
    @synchronized(self) {
        if (!sharedSingleton) {
            sharedSingleton = [[GlobalService alloc] init];
        }
        return sharedSingleton;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _colorList = [[NSArray alloc] initWithObjects:
                      [UIColor colorWithRed:250 / 255.0f green:157 / 255.0f blue:28 / 255.0f alpha:1.0f],
                      [UIColor colorWithRed:76 / 255.0f green:182 / 255.0f blue:178 / 255.0f alpha:1.0f],
                      [UIColor colorWithRed:111 / 255.0f green:176 / 255.0f blue:127 / 255.0f alpha:1.0f],
                      [UIColor colorWithRed:238 / 255.0f green:90 / 255.0f blue:57 / 255.0f alpha:1.0f],
                      [UIColor colorWithRed:64 / 255.0f green:46 / 255.0f blue:35 / 255.0f alpha:1.0f],
                      nil];
        _foodList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)insertFood:(Food *)food
{
    [_foodList addObject:food];
    [self backupToFile];
}

- (Food *)foodAtIndex:(NSInteger)index
{
    if ([_foodList count]) {
        return [_foodList objectAtIndex:index];
    }
    return nil;
}

- (void)deleteFoodAtIndex:(NSInteger)index
{
    [_foodList removeObjectAtIndex:index];
    [self backupToFile];
}

- (NSInteger)foodListCount
{
    return _foodList.count;
}

- (void)backupToFile
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [_foodList enumerateObjectsUsingBlock:^(Food *food, NSUInteger idx, BOOL *stop) {
        [arr addObject:[food dictionaryValue]];
    }];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:arr, @"food", nil];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [[FileUtils sharedSingleton] writeToFile:@"food_list" str:jsonStr];
}

- (void)recoverFromFile
{
    NSString *jsonStr = [[FileUtils sharedSingleton] readFromFile:@"food_list"];
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *result = [dict objectForKey:@"food"];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [result enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        Food *food = [[Food alloc] initWithDictionary:dict];
        [arr addObject:food];
    }];
    _foodList = nil;
    _foodList = [arr mutableCopy];
}

- (Food *)getRandomFood
{
    NSInteger index = arc4random() % [_foodList count];
    return [self foodAtIndex:index];
}

- (UIColor *)getRandomColor
{
    NSInteger index = arc4random() % [_colorList count];
    _currentColor = [_colorList objectAtIndex:index];
    return _currentColor;
}

@end
