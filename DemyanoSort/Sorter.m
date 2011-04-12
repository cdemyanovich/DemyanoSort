#import <stdlib.h>
#import "Sorter.h"


@implementation Sorter

- (NSArray *)quickSort:(NSArray *)list
{
    if ([list count] <= 1)
    {
        return list;
    }
    
    // if all items same, return list
    NSSet *set = [NSSet setWithArray:list];
    if ([set count] == 1)
    {
        return list;
    }
    
    NSMutableArray *unsortedList = [NSMutableArray arrayWithArray:list];
    
    // obtain random pivot
    NSUInteger pivotIndex = arc4random() % ([unsortedList count] - 1);
    NSNumber *pivot = [unsortedList objectAtIndex:pivotIndex];
    [unsortedList removeObjectAtIndex:pivotIndex];
    
    // find all values <= pivot
    NSPredicate *lessThanOrEqualToPredicate = [NSPredicate predicateWithFormat:@"intValue <= %d", [pivot intValue]];
    NSArray *lessThanOrEqualToPivot = [unsortedList filteredArrayUsingPredicate:lessThanOrEqualToPredicate];
    
    // find all values >  pivot
    NSPredicate *greaterThanOrEqualToPredicate = [NSPredicate predicateWithFormat:@"intValue > %d", [pivot intValue]];
    NSArray *greaterThanOrEqualToPivot = [unsortedList filteredArrayUsingPredicate:greaterThanOrEqualToPredicate];
    
    NSUInteger capacity = [lessThanOrEqualToPivot count] + 1 + [greaterThanOrEqualToPivot count];
    NSMutableArray *sortedList = [NSMutableArray arrayWithCapacity:capacity];
    [sortedList addObjectsFromArray:[self quickSort:lessThanOrEqualToPivot]];
    [sortedList addObject:pivot];
    [sortedList addObjectsFromArray:[self quickSort:greaterThanOrEqualToPivot]];
    return sortedList;
}

@end
