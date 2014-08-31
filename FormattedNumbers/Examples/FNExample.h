@interface FNExample : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSArray *list;

- (id)initWithName:(NSString *)name
           summary:(NSString *)summary
              list:(NSArray *)list;
@end
