//
//  WordEffects.m
//  Word-Effects
//
//  Created by Cameron Mcleod on 2019-05-27.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "WordEffects.h"

@implementation WordEffects

- (instancetype)initWithString:(NSString *)string andEffect: (int) chosenEffect {
    
    self = [super init];
    if (self) {
        _effectString = string;
        _effectCase = chosenEffect;
    }
    return self;
}

- (NSString *)effect {
    
    NSString * changedString = _effectString;
    NSInteger  numberValue;
    NSArray *punctuation = @[@",", @".", @"\"", @"\'", @"?",@"!"];
    
    switch (_effectCase) {
        case 1:
            // Uppercase
            changedString = [changedString uppercaseString];
            break;
            
        case 2:
            // Lowercase
            changedString = [changedString lowercaseString];
            break;
            
        case 3:
            // Numberize
            if ([changedString integerValue]) {
                
                numberValue = [changedString integerValue];
                changedString = [NSString localizedStringWithFormat: @"%ld", numberValue];
                
            } else (changedString = @"Input was not a number!");
            break;
            
        case 4:
            // Canadianize
            changedString = [changedString stringByAppendingString: @", eh?"];
            break;
            
        case 5:
            // Respond
            if ([changedString hasSuffix: @"?"]) {
                changedString = @"I don't know";
                
            } else if ([changedString hasSuffix: @"!"]) {
                changedString = @"Whoa, calm down!";
                
            }
            break;
            
        case 6:
            // De-Space-It
            changedString = [changedString stringByReplacingOccurrencesOfString: @" " withString: @"-"];
            break;
            
        case 7:
            // Letter Count
            changedString = [changedString stringByReplacingOccurrencesOfString: @" " withString: @""];
            changedString = [NSString stringWithFormat:@"%lu", [changedString length]];
            
            break;
        case 8:
            // remove all punctuation
            for (NSString *punct in punctuation) {
                changedString = [changedString stringByReplacingOccurrencesOfString: punct withString: @""];
            }
            break;
            break;
    }
    return changedString;
}

@end
