//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */
- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"self MATCHES 'apple'"];
    NSArray *resultArray = [fruits filteredArrayUsingPredicate:filter];
    
    
    
   /*
    NSMutableArray *resultArray =[[NSMutableArray alloc]init];
    for (NSString *fruit in fruits){
        if ([fruit isEqualToString:@"apple"]){
            [resultArray addObject:fruit];
        }
    }
    */
    
    
    return resultArray;
}


-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    //NSArray *resultArray = [database valueForKey:season ];
    NSArray *resultArray = database[season];
    return resultArray;
}


-(NSArray *)suppliesInHoliday:(NSString *)holiday
                     inSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    //NSMutableArray *seasonArray = [[NSMutableArray alloc]init];
    //seasonArray = [[database valueForKey:season]valueForKey:holiday];
    NSMutableArray *seasonArray = database[season][holiday];
    return seasonArray;
}

-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    //[ [jenny allKeys] containsObject:@"last_name"]
    if ([[database[season] allKeys] containsObject:holiday]){
        return true;
    }else{
        return false;
    }
}


-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database {
/*
    NSArray *holidayArray = database[season][holiday];
    if ([holidayArray containsObject: supply]){
        return true;
    }else{
        return false;
    }
*/
    NSLog(@"\n\n\n [database[season][holiday] %@ \n\n\n", database[season][holiday] );
    
    if ([database[season][holiday] containsObject: supply]){
        return true;
    }else{
        return false;
    }
    
    
}


-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {

    database[season][holiday] = [[NSMutableArray alloc]init];
    
    return database;
}


-(NSDictionary *)addSupply:(NSString *)supply
                 toHoliday:(NSString *)holiday
                  inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database {
    database[season][holiday] = [[NSMutableArray alloc]init];
    [database[season][holiday] addObject:supply];
    

    
   database[season][holiday] = [[NSMutableArray alloc]init];
    [database[season][holiday] addObject:supply];

    
    return database;
}

@end