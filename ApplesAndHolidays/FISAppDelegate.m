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
    BOOL supplyIndicator = NO;
    if ([database[season][holiday]containsObject:supply]) {
        supplyIndicator = YES;
    }
    return supplyIndicator;
}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    database[season][holiday] = [@[]mutableCopy];
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    [database[season][holiday]addObject:supply];
    return database;
}

@end