#import "BlockheadCraftableItemObject.h"

@implementation BlockheadCraftableItemObject

@synthesize skinOptions;
@synthesize name;

- (void)dealloc {
    [self->name release];

    [super dealloc];
}

- (NSMutableDictionary *)getSaveDict {
    NSMutableDictionary *saveDict = [super getSaveDict];

    saveDict[@"name"] = self->name;
    saveDict[@"skinOptions"] = [NSData dataWithBytes:&self->skinOptions length:20];
    saveDict[@"craftableObjectType"] = @(1);

    return saveDict;
}

- (BlockheadCraftableItemObject *)initWithCraftableItem:(CraftableItem)craftableItem_ name:(NSString *)name_ skinOptions:(BlockheadSkinOptions)skinOptions_ {
    return nil;
}

- (BlockheadCraftableItemObject *)initWithSaveDict:(NSDictionary *)saveDict {
    return nil;
}

@end