#import <stdlib.h>
#import "NSMutableArray_Shuffling.h"

@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
    for (NSUInteger currentIndex = 0; currentIndex < [self count]; currentIndex++) {
        NSUInteger randomIndex = arc4random() % ([self count] - 1);
        [self exchangeObjectAtIndex:currentIndex withObjectAtIndex:randomIndex];
    }
}

@end
