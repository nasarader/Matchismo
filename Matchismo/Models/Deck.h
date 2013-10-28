//
//  Deck.h
//  Matchismo
//
//  Created by Steve Rader on 5/13/13.
//  Copyright (c) 2013 Steve Rader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
