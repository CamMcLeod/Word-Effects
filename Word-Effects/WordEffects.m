//
//  WordEffects.m
//  Word-Effects
//
//  Created by Cameron Mcleod on 2019-05-27.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "WordEffects.h"

@implementation WordEffects

- (instancetype)initWithString:(NSMutableString *)string andEffect: (int) chosenEffect {
    
    self = [super init];
    if (self) {
        _effectString = string;
        _effectCase = chosenEffect;
    }
    return self;
}

- (NSMutableString *)effect {
    
    NSMutableString * changedString = _effectString;
    NSInteger  numberValue;
    NSArray *punctuation = @[@",", @".", @"\"", @"\'", @"?",@"!"];
    
    switch (_effectCase) {
        case 1:
            // Uppercase
            [changedString setString:[changedString uppercaseString]];
            break;
            
        case 2:
            // Lowercase
            [changedString setString:[changedString lowercaseString]];
            break;
            
        case 3:
            // Numberize
            if ([changedString integerValue]) {
                
                numberValue = [changedString integerValue];
                [changedString setString: [NSMutableString localizedStringWithFormat: @"%ld", numberValue]];
                
            } else ([changedString setString: @"Input was not a number!"]);
            break;
            
        case 4:
            // Canadianize
            
            [changedString setString: [changedString stringByAppendingString: @", eh?"]];
            break;
            
        case 5:
            // Respond
            if ([changedString hasSuffix: @"?"]) {
                [changedString setString: @"I don't know"];
                
            } else if ([changedString hasSuffix: @"!"]) {
                [changedString setString: @"Whoa, calm down!"];
                
            }
            break;
            
        case 6:
            // De-Space-It
            [changedString setString: [changedString stringByReplacingOccurrencesOfString: @" " withString: @"-"]];
            break;
            
        case 7:
            // Letter Count
            [changedString setString: [changedString stringByReplacingOccurrencesOfString: @" " withString: @""]];
            [changedString setString: [NSMutableString stringWithFormat:@"%lu", [changedString length]]];
            
            break;
        case 8:
            // remove all punctuation
            for (NSString *punct in punctuation) {
                [changedString setString: [changedString stringByReplacingOccurrencesOfString: punct withString: @""]];
            }
            break;
            break;
    }
    return changedString;
}

@end
