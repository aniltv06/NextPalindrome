//
//  AppDelegate.m
//  palindrome
//
//  Created by Anil on 6/1/16.
//  Copyright (c) 2016 Anil. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *inputText;
@property (weak) IBOutlet NSTextField *palinLabel;

-(IBAction)getNextPalindrome:(id)sender;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    //self.palinLabel.stringValue = [NSString stringWithFormat:@"%ld",[self palindrome:99999999999999999]];
    self.palinLabel.stringValue = [NSString stringWithFormat:@"Enter Number Above"];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(IBAction)getNextPalindrome:(id)sender
{
    self.palinLabel.stringValue = [NSString stringWithFormat:@"%ld",[self palindrome:[self.inputText.stringValue integerValue]]];
}
- (NSString*)reverseString:(NSString*)string
{
    NSMutableString *reversedString = [NSMutableString string];
    
    NSInteger charIndex = [string length];
    
    while (string && charIndex > 0)
    {
        charIndex--;
        [reversedString appendString:[string substringWithRange:NSMakeRange(charIndex, 1)]];
    }
    
    return reversedString;
}

- (NSInteger) palindrome: (NSUInteger )number
{
    NSInteger palindrome = 00;
    NSString *numberAsString = [NSString stringWithFormat:@"%ld", number];
    NSLog(@"String = %@", numberAsString);
    
    NSUInteger characterCount = [numberAsString length];
    NSLog(@"String Count %ld", characterCount);
    
    NSString *finalString = @"";
    
    if (characterCount % 2)
    {
        // odd
        NSLog(@"ODD");
        
        NSUInteger i = characterCount/2;
        // NSLog(@"centre Index - %ld",i+1);
        
        NSString * middleString = [numberAsString substringWithRange:NSMakeRange(i, 1)];
        NSLog(@"middleString - %@", middleString);
        
        NSString * leftString = [numberAsString substringWithRange:NSMakeRange(0, i)];
        NSLog(@"leftString - %@", leftString);
        
        NSString * rightString = [numberAsString substringWithRange:NSMakeRange(i+1, i)];
        NSLog(@"rightString - %@", rightString);
        
        NSString *leftMirrorString = [self reverseString:leftString];
        NSLog(@"leftMirrorString - %@", leftMirrorString);
        NSInteger leftNumber = [leftString integerValue];
        
        if ([leftMirrorString integerValue] <= [rightString integerValue])
        {
            if ([middleString integerValue] == 9)
            {
                //Add 1 to left number
                NSUInteger leftNumberLengthBefore = [leftString length];
                leftNumber = [leftString integerValue] + 1;
                middleString = [NSString stringWithFormat:@"0"];
                NSUInteger leftNumberLengthAfter = [[NSString stringWithFormat:@"%ld",leftNumber] length];
                if (leftNumberLengthBefore != leftNumberLengthAfter)
                {
                    middleString = [NSString stringWithFormat:@""];
                }
            }
            else
            {
                middleString = [NSString stringWithFormat:@"%ld",[middleString integerValue]+1];
            }
        }
        else
        {
            //Do Nothing
        }
        NSString *leftStr = [NSString stringWithFormat:@"%ld", leftNumber];
        if (leftNumber == 0)
        {
            finalString = [NSString stringWithFormat:@"%@", middleString];
        }
        else
        {
            NSString * rightStr = [self reverseString:[NSString stringWithFormat:@"%ld",leftNumber]];
            finalString = [NSString stringWithFormat:@"%@%@%@",leftStr, middleString, rightStr];
            NSLog(@"%@",finalString);
        }
        
    }
    else
    {
        // even
        NSLog(@"EVEN");
        
        NSUInteger i = characterCount/2;
        NSLog(@"centre Index - %ld",i);
        NSString * leftString = [numberAsString substringWithRange:NSMakeRange(0, i)];
        NSLog(@"leftString - %@", leftString);
        
        NSString * rightString = [numberAsString substringWithRange:NSMakeRange(i, i)];
        NSLog(@"rightString - %@", rightString);
        
        NSString *leftMirrorString = [self reverseString:leftString];
        NSLog(@"leftMirrorString - %@", leftMirrorString);
        NSInteger leftNumber = [leftString integerValue];
        if ([leftMirrorString integerValue] <= [rightString integerValue])
        {
            //Add 1 to left number
            leftNumber = [leftString integerValue] + 1;
        }
        else
        {
            //Do Nothing
        }
        NSString *leftStr = [NSString stringWithFormat:@"%ld", leftNumber];
        NSString * rightStr = [self reverseString:[NSString stringWithFormat:@"%ld",leftNumber]];
        finalString = [NSString stringWithFormat:@"%@%@",leftStr, rightStr];
        NSLog(@"%@",finalString);
    }
    palindrome = [finalString integerValue];
    return palindrome;
}

@end
