//
//  main.m
//  Word-Effects
//
//  Created by Cameron Mcleod on 2019-05-27.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordEffects.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (TRUE) {
            
            // 255 unit long array of characters
            
            char inputNumber[2];
            char inputChars[255];
            int effectCase = 0;
            
            printf("Input a string:");
            
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            
            // print as a c string
            printf("Your string is %s", inputChars);
            
            
            printf("Input a number (1-6) to choose your word effect!");
            // limit input to max 1 characters
            
            BOOL j = TRUE;
            
            while (j){
                
                // effectCase = scanf(@"%d", &inputNumber);
                fgets(inputNumber, 32, stdin);
                effectCase = atoi(&inputNumber[0]);
                if (effectCase < 7 && effectCase > 0){
                    j = FALSE;
                }
                else {
                    printf("That number is not an option. Input a number (1-6) to choose your word effect!");
                }
            }
            
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            inputString = [inputString stringByReplacingOccurrencesOfString: @"\n" withString: @""];
            // assign effect to WordEffects class
            WordEffects * myEffect = [[WordEffects alloc] initWithString: inputString  andEffect:effectCase];
            
            // run effect operation on the string
            NSLog(@"Your output with effect %d is : %@", myEffect.effectCase, [myEffect effect]);
        }
        
    }
    return 0;
}
