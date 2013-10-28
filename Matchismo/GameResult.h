//
//  GameResult.h
//  Matchismo
//
//  Created by Steve Rader on 5/18/13.
//  Copyright (c) 2013 Steve Rader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+ (NSArray *)allGameResults;
- (void)sortByDate;
@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (nonatomic) int score;
@property (readonly, nonatomic) NSTimeInterval duration;

@end
