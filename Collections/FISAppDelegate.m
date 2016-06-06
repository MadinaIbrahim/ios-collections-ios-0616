//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/**
 
 * Define your methods here.
 
 */

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    NSSortDescriptor *ascendingSorting = [NSSortDescriptor  sortDescriptorWithKey:nil ascending:YES];
    NSArray *newArray = [array sortedArrayUsingDescriptors:@[ascendingSorting]];
    
    return newArray; //1
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    NSSortDescriptor *descendingSorting = [NSSortDescriptor  sortDescriptorWithKey:nil ascending:NO];
    array = [array sortedArrayUsingDescriptors:@[descendingSorting]];
    
    return array; //2
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    
    NSMutableArray *mArray = [array mutableCopy];
    
    [mArray exchangeObjectAtIndex:0 withObjectAtIndex:([array count] - 1)];

    return mArray; //3
}

-(NSArray *)arrayByReversingArray:(NSArray *)array {
    
    return [[array reverseObjectEnumerator] allObjects];
    
    //NSArray *reversed = [[array reverseObjectEnumerator] allObjects];
    //return reversed; //4
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    NSDictionary *leetBasic = @{@"a" :@"4",
                                @"s" :@"5",
                                @"i" :@"1",
                                @"l" :@"1",
                                @"e" :@"3",
                                @"t" :@"7"};
    
    NSString *StringInLeet = [string mutableCopy];
    for (NSString *letter in leetBasic) {
        NSString *number = leetBasic[letter];
        StringInLeet = [StringInLeet stringByReplacingOccurrencesOfString:letter withString:number];// iteration
        
    }
    return StringInLeet; //5
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    
    NSMutableArray *positiveArray = [[NSMutableArray alloc]init];
    NSMutableArray *negativeArray = [[NSMutableArray alloc]init];
    
    for (NSNumber *numValue in array) {
        if ([numValue integerValue] >= 0) {
            [positiveArray addObject:numValue];
        } else {
            [negativeArray addObject:numValue];
        }
    }
    return @[negativeArray, positiveArray]; //6
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
 
NSArray *keyNameHobbit = [dictionary allKeysForObject:@"hobbit"];

   return keyNameHobbit;//7
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    NSPredicate *BeginsWithPrefixA = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[cd]'a'"];
    NSArray *stringsWitthPrefixA = [array filteredArrayUsingPredicate:BeginsWithPrefixA];
    return stringsWitthPrefixA; //8
}

- (NSInteger ) sumOfIntegersInArray: (NSArray *)array {
    NSInteger sum = 0;
    for (NSNumber *num in array) {
        sum += [num integerValue];
    }
    return sum; //9
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSMutableArray *pluralFormMutableArray = [[NSMutableArray alloc]init];
    
    NSString *pluralWord = @"";
    
    for (NSString *singularWord in array) {
        if ([[singularWord substringFromIndex:[singularWord length]-2]containsString:@"us"]) {
              pluralWord = [singularWord stringByReplacingOccurrencesOfString:@"us" withString:@"i"];

        } else if ([[singularWord substringFromIndex:[singularWord length]-2]containsString:@"um"]) {
            pluralWord = [singularWord stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
            
        }else if ([[singularWord substringFromIndex:[singularWord length]-1]containsString:@"d"]) {
            pluralWord = [singularWord stringByAppendingString:@"s"];
            
        }else if ([[singularWord substringFromIndex:[singularWord length]-1]containsString:@"e"]) {
            pluralWord = [singularWord stringByAppendingString:@"s"];
            
        }else if([singularWord containsString:@"oo"]) {
                pluralWord = [singularWord stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
            
        }else if ([singularWord containsString:@"ox"]) {
            if([singularWord hasPrefix:@"b"]) {
                pluralWord = [singularWord stringByAppendingString:@"es"];
            } else {
                pluralWord = [singularWord stringByAppendingString:@"en"];
            }
        }
        [pluralFormMutableArray addObject:pluralWord];
    }
    
    NSLog(@"%@", pluralFormMutableArray);
    
    return pluralFormMutableArray; //10
}


-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    string = [string lowercaseString];
    NSArray *stringPunctuations = @[@".", @",", @"!", @"?", @":", @";", @"-"];
    for (NSString *PunctuationToRemove in stringPunctuations) {
            
    string = [string stringByReplacingOccurrencesOfString:PunctuationToRemove withString:@""];
    }
    NSArray *words = [string componentsSeparatedByString:@" "];
    
    NSMutableDictionary *wordCounts = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in words) {
        
        if (![[wordCounts allKeys] containsObject:word]) {
            wordCounts[word] = @1;
        } else {
    NSNumber *occurences = wordCounts[word];
                            
    NSUInteger intOccurences = [occurences unsignedIntegerValue];
            intOccurences += 1;
            
    NSNumber *newOccurences = @(intOccurences);
            wordCounts[word] = newOccurences;
                }
    }
    return wordCounts; //11
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    NSMutableDictionary *artistsWithSongs = [[NSMutableDictionary alloc]init];

    for  (NSString *stringArtistsAndSongs in array) {
        NSArray *artistsAndSongs = [stringArtistsAndSongs componentsSeparatedByString:@" - "]; //Returns an array containing substrings from the receiver that have been divided by a given separator (@" - ").
        NSString *artist = artistsAndSongs [0];
        NSString *song  = artistsAndSongs [1];
        
        //if statement to check if the artist is already a key in the dictionary
        if  ([ [artistsWithSongs allKeys] containsObject: artist]) {
            
            //means yes, it is in dictionary. which means songs has already been made into an array. so we're just going to add the song to the array
            [artistsWithSongs[artist] addObject: song];
            
            //if no?
        } else {
            //means no, songs is not in the dictionary. we need to create the key-value pair. this is our chance to make songs into a mutable array. so when the if statement is yes, we can just call the addobject method to add another song.
            artistsWithSongs[artist] = [@[song] mutableCopy];
        }
    }

     NSSortDescriptor *alphabetaized = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    for (NSString *artist in [artistsWithSongs allKeys]) {
       
        [artistsWithSongs[artist] sortUsingDescriptors:@[alphabetaized]];

    }

    return [NSDictionary dictionaryWithDictionary:artistsWithSongs];

}




@end

