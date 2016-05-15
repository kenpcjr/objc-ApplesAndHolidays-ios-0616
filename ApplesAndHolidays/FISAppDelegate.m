//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    NSPredicate *predOnlyApples = [NSPredicate predicateWithFormat:@"self contains 'apple'"];
    NSArray *onlyApples = [fruits filteredArrayUsingPredicate:predOnlyApples];
    return onlyApples;
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [database[season]allKeys];
    /*NSPredicate *predHolidays = [NSPredicate predicateWithFormat:@"self contains 'Day'"];
    NSArray *filteredHolidays = [holidays filteredArrayUsingPredicate:predHolidays];
    
    
    
    NSArray *databaseKeys = [database allKeys];
    NSLog(@"%@",databaseKeys);
    NSArray *holidays = [databaseKeys filteredArrayUsingPredicate:predHolidays];*/
    NSLog(@"%@",holidays);
    return holidays;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableArray *supplies = database[season][holiday];
    return supplies;
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    BOOL holidayIndicator = NO;
    NSArray *seasonKeys = [database[season]allKeys];
    if ([seasonKeys containsObject:holiday]) {
        holidayIndicator = YES;
    }
    return holidayIndicator;
}

-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    return nil;
}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    return nil;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    return nil;
}

@end