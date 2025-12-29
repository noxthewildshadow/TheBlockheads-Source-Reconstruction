#import "Chest.h"

#import "Blockhead.h"
#import "DynamicWorld.h"
#import "InteractionObject.h"
#import "World.h"

// TODO: find appropriate file for this function.
ItemType itemTypeFromChestType(ChestType chestType) {
    switch (chestType) {
        case ChestType::CHEST_SAFE:
            return ITEM_SAFE;
        case ChestType::CHEST_SHELF:
            return ITEM_SHELF;
        case ChestType::CHEST_GOLD:
            return ITEM_CHEST_GOLD;
        case ChestType::CHEST_PORTAL:
            return ITEM_CHEST_PORTAL;
        case ChestType::CHEST_DISPLAY_CABINET:
            return ITEM_DISPLAY_CABINET;
        case ChestType::CHEST_FEEDER:
            return ITEM_CHEST_FEEDER;
        default:
            return ITEM_CHEST;
    }
}

@implementation Chest

@synthesize inventoryChanged;

- (NSString *)actionTitle {
    return [NSString stringWithFormat:@"USE %@", [self title]];
}

- (int)addDodoEggDrawQuadData:(float *)buffer fromIndex:(int)index {
    return 0;
}

- (int)addDrawCubeData:(float *)buffer fromIndex:(int)index {
    return 0;
}

- (int)addDrawItemQuadData:(float *)buffer fromIndex:(int)index {
    return 0;
}

- (int)addDrawQuadData:(float *)buffer fromIndex:(int)index forMacroPos:(intpair)macroPos {
    return 0;
}

- (BOOL)canBeUsedByBlockhead:(Blockhead *)blockhead {
    if ([self->world isAdmin] && [blockhead isClientBlockheadBeingControlledByServer]) {
        return YES;
    }

    if (![super canBeUsedByBlockhead:blockhead]) {
        return NO;
    }

    if (self->chestType == CHEST_SAFE || self->chestType == CHEST_DISPLAY_CABINET || self->chestType == CHEST_PORTAL) {
        if (self->ownerID) {
            return [[blockhead localNetID] isEqualToString:self->ownerID];
        }
    }

    return YES;
}

- (ChestType)chestType {
    return self->chestType;
}

- (void)contentsDidChange {
    if (self->proxyObjectOwner) {
        [self->proxyObjectOwner childNeedsSaving:self];
    } else {
        [self->dynamicWorld dynamicWorldChangedAtPos:[self pos] objectType:[self objectType]];
    }

    [self setUpdateNeedsToBeSent:YES];
    self->inventoryNeedsToBeSentWithUpdate = YES;

    // TODO
}

- (void)dealloc {
    [self->inventoryItems release];

    [super dealloc];
}

- (ItemType)destroyItemType {
    return itemTypeFromChestType(self->chestType);
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
    return itemTypeFromChestType(self->chestType);
}

- (NSMutableDictionary *)getSaveDict {
    return [self getSaveDictIncludingInventory:self->chestType != CHEST_PORTAL];
}

- (NSMutableDictionary *)getSaveDictIncludingInventory:(BOOL)includeInventory {
    return nil;
}

- (void)initSubDerivedItems {
}

- (Chest *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld atPosition:(intpair)pos cache:(CPCache *)cache_ type:(ItemType)itemType_ saveDict:(NSDictionary *)saveDict placedByClient:(NSString *)clientId clientName:(NSString *)clientName {
    return nil;
}

- (Chest *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld cache:(CPCache *)cache_ netData:(NSData *)netData {
    return nil;
}

- (Chest *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld saveDict:(NSDictionary *)saveDict cache:(CPCache *)cache_ {
    return nil;
}

- (InteractionObjectType)interactionObjectType {
    return 2;
}

- (ItemType)interactionRenderItemType {
    return itemTypeFromChestType(self->chestType);
}

- (NSData *)inventoryDataAllowingEmpty:(BOOL)allowEmptyInventory {
    return nil;
}

- (NSArray *)inventoryItems {
    return nil;
}

- (BOOL)isPaintable {
    return YES;
}

- (void)loadInventoryItemsFromDiskIfNeeded {
    if (!self->inventoryItems && self->chestType != CHEST_PORTAL && ![self isNet]) {
        [self updateInventoryWithData:[self->dynamicWorld loadLocalInventoryDataForChest:self]];
    }
}

- (int)moveInventoryItemsFromArray:(NSMutableArray *)fromItemSlot toIndex:(int)toIndex count:(int)count {
    return 0;
}

- (int)moveInventoryItemsFromArray:(NSMutableArray *)fromItemSlot toIndex:(int)toIndex count:(int)count assignedIndexes:(std::set<int> *)assignedIndexes {
    return 0;
}

- (DynamicObjectType)objectType {
    return DYNAMIC_OBJECT_TYPE_CHEST;
}

- (BOOL)occupiesNormalContents {
    return YES;
}

- (void)paint:(uint16_t)colorIndex {
}

- (void)remoteInventoryDataRecieved:(NSData *)remoteInventoryData {
    [self updateInventoryWithData:remoteInventoryData];
}

- (void)remoteUpdate:(NSData *)netData {
}

- (void)remove:(Blockhead *)removeBlockhead {
    if ([self needsRemoved] || [self isNet]) { return; }

    if ([self isInUse]) {
        if ([[self currentBlockhead] isNet] || self->remoteBlockheadInUseUniqueID) {
            self->needsToBeRemovedWhenInteractionEnds = YES;

            return;
        }

        [[self currentBlockhead] stopInteracting];
    }

    [self->world    removeTileAtWorldX:[self pos].x
                                worldY:[self pos].y
          createContentsFreeblockCount:1
createForegroundContentsFreeblockCount:0
                       removeBlockhead:removeBlockhead
    ];

    [self setNeedsRemoved:YES];
}

- (void)removeFromMacroBlock {
}

- (BOOL)removeItemIfAvailable:(ItemType)itemType {
    return NO;
}

- (BOOL)requiresHumanInteraction {
    return YES;
}

- (void)setNeedsRemoved:(BOOL)newNeedsRemoved {
    [super setNeedsRemoved:newNeedsRemoved];

    if (!newNeedsRemoved) { return; }

    if ([self isInUse]) {
        [[self currentBlockhead] stopInteracting];
    }
}

- (void)startInteractionWithBlockhead:(Blockhead *)blockhead {
}

- (int)staticGeometryDodoEggCount {
    return 0;
}

- (int)staticGeometryDrawCubeCount {
    return 0;
}

- (int)staticGeometryDrawItemQuadCount {
    return 0;
}

- (int)staticGeometryDrawQuadCountForMacroPos:(intpair)macroPos {
    return self->chestType == CHEST_DISPLAY_CABINET;
}

- (NSString *)title {
    switch (self->chestType) {
        case CHEST_SAFE:
            return @"SAFE";
        case CHEST_SHELF:
            return @"SHELF";
        case CHEST_GOLD:
            return @"GOLDEN CHEST";
        case CHEST_PORTAL:
            return @"PORTAL CHEST";
        case CHEST_DISPLAY_CABINET:
            return @"CABINET";
        case CHEST_FEEDER:
            return @"FEEDER CHEST";
        default:
            return @"CHEST";
    }
}

- (void)update:(float)dt accurateDT:(float)accurateDT isSimulation:(BOOL)isSimulation {
    if ([self needsRemoved]) { return; }

    [super update:dt accurateDT:accurateDT isSimulation:isSimulation];

    if (![self currentBlockhead] && [self isNet] && !self->proxyObjectOwner && self->chestType != CHEST_PORTAL) {
        [self->inventoryItems release];
        self->inventoryItems = nil;
    }
}

- (void)updateInventoryWithData:(NSData *)inventoryData {
}

- (NSData *)updateNetDataForClient:(NSString *)clientID {
    return nil;
}

- (void)updatePosition:(intpair)newPosition {
    if ([self isInUse] && (newPosition.x != [self pos].x || newPosition.y != [self pos].y)) {
        [[self currentBlockhead] stopInteracting];
    }

    [super updatePosition:newPosition];
}

- (void)worldChanged:(std::vector<intpair> *)worldChangedPositions {
}

- (void)worldContentsChanged:(std::vector<intpair> *)worldContentsChangedPositions {
    [self worldChanged:worldContentsChangedPositions];
}

@end
