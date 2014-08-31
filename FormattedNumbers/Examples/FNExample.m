#import "FNExample.h"

@implementation FNExample

- (id)initWithName:(NSString *)name
           summary:(NSString *)summary
              list:(NSArray *)list
{
    self = [self init];
    if (self) {
        self.name = name;
        self.summary = summary;
        self.list = list;
    }
    return self;
}

@end
