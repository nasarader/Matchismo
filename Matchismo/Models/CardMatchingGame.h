//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Steve Rader on 5/15/13.
//  Copyright (c) 2013 Steve Rader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
- (id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (strong, nonatomic) NSString *result;
@property (nonatomic, getter=isMatch2Game) BOOL match2Game;


@end
