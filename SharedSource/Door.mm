#import "Door.h"

#import "World.h"
#import "Blockhead.h"

@implementation Door

- (int)addDrawCubeData:(float *)buffer fromIndex:(int)index {
    return 0;
}

- (int)addDrawQuadData:(float *)buffer fromIndex:(int)index forMacroPos:(intpair)macroPos {
    return 0;
}

- (BOOL)canBeUsedByBlockhead:(Blockhead *)blockhead {
    return NO;
}

- (void)checkAndUpdateBlockedStatus {
}

- (NSData *)creationNetDataForClient:(NSString *)clientID {
    return nil;
}

- (void)dealloc {
    [self->ironPlaceClientID release];
    [self->ownerID release];

    [super dealloc];
}

- (void)draw:(float)dt projectionMatrix:(GLKMatrix4)projectionMatrix modelViewMatrix:(GLKMatrix4)modelViewMatrix cameraMinXWorld:(int)cameraMinXWorld cameraMaxXWorld:(int)cameraMaxXWorld cameraMinYWorld:(int)cameraMinYWorld cameraMaxYWorld:(int)cameraMaxYWorld {
}

- (uint16_t)freeBlockCreationDataA {
    return 0;
}

- (uint16_t)freeBlockCreationDataB {
    return 0;
}

- (NSMutableDictionary *)freeBlockCreationSaveDict {
    return [self getSaveDict];
}

- (ItemType)freeblockCreationItemType {
    return self->itemType;
}

- (NSMutableDictionary *)getSaveDict {
    NSMutableDictionary *saveDict = [super getSaveDict];

    saveDict[@"itemType"] = @(self->itemType);
    saveDict[@"blocked"] = @(self->blocked);

    if (self->ironPlaceClientID) {
        saveDict[@"ironPlaceClientID"] = self->ironPlaceClientID;
    }

    if (self->ownerID) {
        saveDict[@"ownerID"] = self->ownerID;
    }

    return saveDict;
}

- (void)initSubDerivedItems {
}

- (Door *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld atPosition:(intpair)pos cache:(CPCache *)cache_ type:(ItemType)itemType_ saveDict:(NSDictionary *)saveDict placedByClient:(NSString *)clientId {
    return nil;
}

- (Door *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld cache:(CPCache *)cache_ netData:(NSData *)netData {
    return nil;
}

- (Door *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld saveDict:(NSDictionary *)saveDict cache:(CPCache *)cache_ {
    return nil;
}

- (BOOL)isOpen {
    return self->open;
}

- (ItemType)itemType {
    return self->itemType;
}

- (DynamicObjectType)objectType {
    return DYNAMIC_OBJECT_TYPE_DOOR;
}

- (BOOL)occupiesBackgroundContents {
    return self->itemType != ITEM_GATE;
}

- (BOOL)occupiesNormalContents {
    return self->itemType == ITEM_GATE;
}

- (void)remoteUpdate:(NSData *)netData {
}

- (void)removeFromMacroBlock {
}

- (void)setNeedsRemoved:(BOOL)needsRemoved {
}

- (void)setOpen:(BOOL)open_ direction:(int)direction {
}

- (int)staticGeometryDrawCubeCount {
    return 2 * (self->itemType == ITEM_GATE);
}

- (int)staticGeometryDrawQuadCountForMacroPos:(intpair)macroPos {
    return 0;
}

- (NSData *)updateNetDataForClient:(NSString *)clientID {
    return [self creationNetDataForClient:clientID];
}

- (void)worldChanged:(std::vector<intpair> *)worldChangedPositions {
}

@end