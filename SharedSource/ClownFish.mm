#import "ClownFish.h"

#import "DrawCube.h"
#import "FishingRod.h"
#import "Shader.h"
#import "Blockhead.h"

@implementation ClownFish

- (void)blockheadUnloaded:(Blockhead *)blockhead {
    if ([self->hookedFishingRod blockhead] == blockhead) {
        [self->hookedFishingRod autorelease];
        self->hookedFishingRod = nil;
    }
}

- (BOOL)canBeCapturedByBlockhead:(Blockhead *)blockhead withItemType:(ItemType)itemType {
    if (itemType != ITEM_TIN_BUCKET) {
        return NO;
    }

    if ([self tamed]) {
        if (![self belongsToPlayerWithBlockhead:blockhead]) {
            return NO;
        }
    }

    return YES;
}

- (NSString *)cantBeCapturedTipStringForBlockhead:(Blockhead *)blockhead withItemType:(ItemType)itemType {
    if (itemType == ITEM_TIN_BUCKET) {
        if ([self tamed] && ![self belongsToPlayerWithBlockhead:blockhead]) {
            return [NSString stringWithFormat:@"THAT %@ BELONGS TO\nSOMEONE ELSE", [self speciesName]];
        } else {
            return nil;
        }
    } else {
        return [NSString stringWithFormat:@"%@ CAN ONLY BE CAPTURED\nIN A BUCKET", [self speciesName]];
    }
}

- (ItemType)captureRequiredItemType {
    return ITEM_TIN_BUCKET;
}

- (ItemType)capturedItemType {
    return ITEM_FISH_BUCKET;
}

- (ClownFishUpdateNetData)clownFishUpdateNetDataForClient:(NSString *)clientIDToSendTo {
    return ClownFishUpdateNetData();
}

- (uint64_t)creationDataStructSize {
    return 112;
}

- (NSData *)creationNetDataForClient:(NSString *)clientID {
    return nil;
}

- (void)dealloc {
    [self->bodyCube release];
    [self->tailCube release];
    [self->sideFinCube release];
    [self->hookedFishingRod setHookedFish:nil];
    [self->hookedFishingRod autorelease];

    [super dealloc];
}

- (void)die:(Blockhead *)killBlockhead_ {
}

- (void)doRemoteUpdate:(ClownFishUpdateNetData)updateNetData {
}

- (void)draw:(float)dt projectionMatrix:(GLKMatrix4)projectionMatrix modelViewMatrix:(GLKMatrix4)modelViewMatrix cameraMinXWorld:(int)cameraMinXWorld cameraMaxXWorld:(int)cameraMaxXWorld cameraMinYWorld:(int)cameraMinYWorld cameraMaxYWorld:(int)cameraMaxYWorld {
}

- (ItemType)foodItemType {
    return ITEM_KELP;
}

- (NSString **)getNamesArray {
    return nullptr;
}

- (int)getNamesArrayCount {
    return 62;
}

- (NSMutableDictionary *)getSaveDict {
    return nil;
}

- (void)hitWithForce:(int)force blockhead:(Blockhead *)blockhead {
}

- (ClownFish *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld_ atPosition:(intpair)pos_ cache:(CPCache *)cache_ saveDict:(NSDictionary *)saveDict isAdult:(BOOL)isAdult wasPlaced:(BOOL)wasPlaced placedByClient:(NSString *)clientId {
    return nil;
}

- (ClownFish *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld cache:(CPCache *)cache_ netData:(NSData *)netData {
    return nil;
}

- (ClownFish *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld saveDict:(NSDictionary *)saveDict cache:(CPCache *)cache_ {
    self = [super initWithWorld:world_ dynamicWorld:dynamicWorld saveDict:saveDict cache:cache_];

    if (!self) {
        return nil;
    }

    [self loadDerivedStuff];

    return self;
}

- (void)loadDerivedStuff {
}

- (float)maxAge {
    return 7200.0f;
}

- (uint16_t)maxHealth {
    return 25;
}

- (NPCType)npcType {
    return NPC_CLOWNFISH;
}

- (void)reactToBeingFed {
}

- (void)reactToBeingHit {
}

- (void)remoteBlockheadHookedYou:(Blockhead *)blockhead {
    if ([blockhead fishingRod] && [[blockhead fishingRod] hookedFish]) {
        if (self->hookedFishingRod != [blockhead fishingRod]) {
            [self->hookedFishingRod autorelease];
            self->hookedFishingRod = [[blockhead fishingRod] retain];
            [[blockhead fishingRod] setHookedFish:self];
        }
    }
}

- (void)remoteCreationDataUpdate:(NSData *)netData {
}

- (void)remoteUpdate:(NSData *)netData {
}

- (Vector2)renderPos {
    return Vector2();
}

- (BOOL)ridableWhenTamed {
    return NO;
}

- (void)setNeedsRemoved:(BOOL)needsRemoved {
    [super setNeedsRemoved:needsRemoved];

    [self->hookedFishingRod autorelease];
    self->hookedFishingRod = nil;
}

- (NSString *)speciesName {
    return @"FISH";
}

- (BOOL)tapIsWithinBodyRadius:(Vector2)tapLocation {
    return NO;
}

- (void)update:(float)dt accurateDT:(float)accurateDT isSimulation:(BOOL)isSimulation {
}

- (NSData *)updateNetDataForClient:(NSString *)clientID {
    return nil;
}

@end