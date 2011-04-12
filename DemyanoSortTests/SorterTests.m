#import "SorterTests.h"
#import "Sorter.h"
#import "NSMutableArray_Shuffling.h"


@implementation SorterTests
{
    Sorter *sorter;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    sorter = [[Sorter alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    [sorter release];
    
    [super tearDown];
}

- (void)testSortEmptyList
{
    NSArray *unsortedList = [NSArray array];
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:unsortedList], @"");
}

- (void)testSortListOfOneItem
{
    NSArray *unsortedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], nil];
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:unsortedList], @"");
}

- (void)testSortListOfTwoUnsortedItems
{
    NSArray *unsortedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:1], nil];
    NSArray *expectedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], nil];
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:expectedList], @"");
}

- (void)testSortListOfTwoSortedItems
{
    NSArray *unsortedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], nil];
    NSArray *expectedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], nil];
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:expectedList], @"");
}

- (void)testSortListOfThreeUnsortedItems
{
    NSArray *unsortedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:1], nil];
    NSArray *expectedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], nil];
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:expectedList], @"");
}

- (void)testSortListOfThreeSortedItems
{
    NSArray *unsortedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], nil];
    NSArray *expectedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], nil];
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:expectedList], @"");
}

- (void)testSortListOfIdenticalItems
{
    NSArray *unsortedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1], nil];
    NSArray *expectedList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1], nil];
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:expectedList], @"");
}

- (void)testSortLargeListOfIdenticalItems
{
    id one = [NSNumber numberWithInt:1];
    NSMutableArray *unsortedList = [NSMutableArray arrayWithCapacity:10000];
    for (int i = 0; i < 10000; i++)
    {
        [unsortedList addObject:one];
    }
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:unsortedList], @"");
}

- (void)testSortLargeListOfItemsInReverseOrder
{
    NSMutableArray *reversedList = [NSMutableArray arrayWithCapacity:10000];
    for (int i = 9999; i >= 0; i--)
    {
        [reversedList addObject:[NSNumber numberWithInt:i]];
    }
    NSMutableArray *expectedList = [NSMutableArray arrayWithCapacity:10000];
    for (int i = 0; i < 10000; i++)
    {
        [expectedList addObject:[NSNumber numberWithInt:i]];
    }
    NSArray *sortedList = [sorter quickSort:reversedList];
    STAssertTrue([sortedList isEqualToArray:expectedList], @"");
}

- (void)testSortLargeListOfItemsInRandomOrder
{
    NSMutableArray *unsortedList = [NSMutableArray arrayWithCapacity:10000];
    for (int i = 0; i < 10000; i++)
    {
        [unsortedList addObject:[NSNumber numberWithInt:i]];
    }
    [unsortedList shuffle];
    NSMutableArray *expectedList = [NSMutableArray arrayWithCapacity:10000];
    for (int i = 0; i < 10000; i++)
    {
        [expectedList addObject:[NSNumber numberWithInt:i]];
    }
    NSArray *sortedList = [sorter quickSort:unsortedList];
    STAssertTrue([sortedList isEqualToArray:expectedList], @"");
}

@end
