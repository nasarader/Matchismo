//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Steve Rader on 5/15/13.
//  Copyright (c) 2013 Steve Rader. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (! _cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
        self.result = [NSString stringWithFormat:@"Flip cards to find a match"];
    }
    return self;
}


- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
//    Card *card1 = nil;
//    Card *card2 = nil;
//    int flipCount = 0;
    int matchScore = 0;
    
    self.result = [NSString stringWithFormat:@"Flip cards to find a match"];
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            // see if flipping this card creates a match
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                 /*   if(flipCount == 0) {
                        card1 = otherCard;
                        flipCount++;
                        
                        matchScore = [card match:@[otherCard]];
                    }
                    else {
                        card2 = otherCard;
                        flipCount++;
                    }
                    
                    if(self.isMatch2Game) {*/
                        matchScore = [card match:@[otherCard]];                        
                        if (matchScore) {
                            otherCard.unplayable = YES;
                            card.unplayable = YES;
                            self.score += matchScore * MATCH_BONUS;
                            self.result = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", card.contents, otherCard.contents, matchScore * MATCH_BONUS];
                        } else {
                            otherCard.faceUp = NO;
                            self.score -= MISMATCH_PENALTY;
                            self.result = [NSString stringWithFormat:@"%@ and %@ don't match! %d point penalty!", card.contents, otherCard.contents, MISMATCH_PENALTY];
                        }
               /*     } else if (flipCount == 2){
                        matchScore = [card match:@[card1,card2]];
                        
                        if (matchScore) {
                            card1.unplayable = YES;
                            card2.unplayable = YES;
                            card.unplayable = YES;
                            self.score += matchScore * MATCH_BONUS;
                            self.result = [NSString stringWithFormat:@"Matched %@, %@, & %@ for %d points", card.contents, card1.contents, card2.contents, matchScore * MATCH_BONUS];
                        } else {
                            card1.faceUp = NO;
                            card2.faceUp = NO;
                            //otherCard.faceUp = NO;
                            self.score -= MISMATCH_PENALTY;
                            self.result = [NSString stringWithFormat:@"%@, %@, & %@ don't match! %d point penalty!", card.contents, card1.contents, card2.contents, MISMATCH_PENALTY];
                        }

                    }*/
                     break;
                }
                self.result = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

@synthesize result = _result; // because we provide setter AND getter


- (NSString *)result
{
    return _result ? _result : @"?";
}

@end
