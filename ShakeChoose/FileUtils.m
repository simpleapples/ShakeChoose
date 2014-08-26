//
//  FileUtils.m
//  Alexa
//
//  Created by duobei on 14-8-14.
//  Copyright (c) 2014年 duobei. All rights reserved.
//

#import "FileUtils.h"

@implementation FileUtils

+ (FileUtils *)sharedSingleton
{
    static FileUtils *sharedSingleton;
    @synchronized(self) {
        if (!sharedSingleton) {
            sharedSingleton = [[FileUtils alloc] init];
        }
        return sharedSingleton;
    }
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (void)writeToFile:(NSString *)file str:(NSString *)str
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *filePath = [basePath stringByAppendingString:[NSString stringWithFormat:@"/%@", file]];
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:filePath]) {
        [manager createFileAtPath:filePath contents:nil attributes:nil];
    }
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:filePath atomically:YES];
}

- (NSString *)readFromFile:(NSString *)file
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *filePath = [basePath stringByAppendingString:[NSString stringWithFormat:@"/%@", file]];
    NSError *error;
    NSString *result = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error != nil) {
        return [[NSString alloc] init];
    }
    return result;
}

@end
