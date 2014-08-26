//
//  FileUtils.h
//  Alexa
//
//  Created by duobei on 14-8-14.
//  Copyright (c) 2014年 duobei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtils : NSObject

+ (FileUtils *)sharedSingleton;

- (void)writeToFile:(NSString *)file str:(NSString *)str;
- (NSString *)readFromFile:(NSString *)file;


@end
