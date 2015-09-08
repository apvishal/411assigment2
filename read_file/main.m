//
//  main.m
//  read_file
//
//  Created by Vishal Patel on 9/5/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //create the file path
        NSString* readFilePath = [[NSBundle mainBundle] pathForResource: @"words" ofType:@"txt"];
        
        //read the text from the file in the file path
        NSError *error;
        NSString *file_contents = [NSString stringWithContentsOfFile:readFilePath encoding:NSUTF8StringEncoding error:&error];
        NSArray *immut_words = [file_contents componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
        NSMutableArray *words = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < immut_words.count; ++i)
        {
            [words addObject: [immut_words objectAtIndex:i]];
        }

        if (error)
            NSLog(@"HEre isthe error: %@", error.localizedDescription);
        else
        {
            //begin timer here...
            NSDate *start_time = [NSDate date];
            for (int i = 0; i < words.count; ++i)
            {
                NSMutableArray *chars = [[NSMutableArray alloc] initWithCapacity:[[words objectAtIndex:i] length]];
                NSMutableArray *sorted_chars = [[NSMutableArray alloc] init];
                for (int j = 0; j < [[words objectAtIndex:i] length]; ++j)
                {
                    NSString *charVar = [NSString stringWithFormat:@"%c",[[words objectAtIndex:i] characterAtIndex:j]];
                    [chars addObject:charVar];
                }
                [sorted_chars addObjectsFromArray:[chars sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]];
                NSString *temp_String = [sorted_chars componentsJoinedByString:@""];
                [chars release];
                [sorted_chars release];
                [words replaceObjectAtIndex:i withObject: temp_String];
                
            }//end of nested loops
            
            //alphabetize the final mutable array
            [words sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            
            //begin searching for anagrams...
            
            //we need to keep count of how many are the same
            int counter=0;
            //keep track of whats the max amount of anagrams
            int max = 0;
            //save the max string
            NSString* max_string = [[NSString alloc] init];

//            NSLog(@"%@", [words description]);
            
            for (int i = 0; i < words.count - 1; ++i)
            {
                if (counter != 0)
                {
                    if ([[words objectAtIndex:i] isEqualToString: [words objectAtIndex:i+1]])
                    {
                        ++counter;
                    }
                    else
                    {
                        if (counter > max)
                        {
                            max = counter;
                            max_string = [words objectAtIndex:i];
                        }
                        counter = 0;
                    }
                }
                else
                {
                    if([[words objectAtIndex:i] isEqualToString: [words objectAtIndex:i+1]])
                    {
                        ++counter;
                    }
                }
            }
            //get the finishing time
            NSDate* end_time = [NSDate date];
            NSTimeInterval totalTime= [end_time timeIntervalSinceDate:start_time];
            
            //display the result to the screen
            NSLog(@"The max string is: %@ with %d occurances\n", max_string, max);
            NSLog(@"The total time is: %f seconds\n", totalTime);
        }
    }
    return 0;
}
