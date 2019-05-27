//
//  WordEffects.h
//  Word-Effects
//
//  Created by Cameron Mcleod on 2019-05-27.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WordEffects : NSObject

@property NSString * effectString;
@property int effectCase;

- (instancetype)initWithString:(NSString *)string andEffect: (int) chosenEffect;

- (NSString *)effect;

@end

NS_ASSUME_NONNULL_END
