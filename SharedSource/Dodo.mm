#import "Dodo.h"

#import "DrawCube.h"
#import "Shader.h"

@implementation Dodo

- (void)addRider:(Blockhead *)blockhead {
    [super addRider:blockhead];

    if (!self->beingControlled) {
        self->riderTargetVelocity = 0.0f;
    }

    self->randomXOffsetGoal = 0.0f;
    self->remoteGoalSquare = [self pos];
    self->remoteWalkSpeed = 0.0f;
    self->remoteMovementDirection = 0;
}

- (BOOL)blockheadCanRide:(Blockhead *)blockhead usingItem:(ItemType)itemType {
    return [self age] > 900.0f && (![self tamed] || [self belongsToPlayerWithBlockhead:blockhead]) && !self->dead &&
           [self needsRemoved] == NO;
}

- (void)blockheadUnloaded:(Blockhead *)blockhead {
    if (self->rider == blockhead) {
        self->riderTargetVelocity = 0.0f;
    }

    [super blockheadUnloaded:blockhead];
}

- (NSString *)breedString {
    return nil;
}

- (Vector2)cameraPosForBlockhead:(Blockhead *)blockhead {
    return [super cameraPosForBlockhead:blockhead];
}

- (BOOL)canBeCapturedByBlockhead:(Blockhead *)blockhead withItemType:(ItemType)itemType {
    if (itemType != ITEM_CAGE) {
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
    if (itemType != ITEM_CAGE || ![self tamed] || [self belongsToPlayerWithBlockhead:blockhead]) {
        return nil;
    }

    return [NSString stringWithFormat:@"THAT %@ BELONGS TO\nSOMEONE ELSE", [self speciesName]];
}

- (ItemType)captureRequiredItemType {
    return ITEM_CAGE;
}

- (ItemType)capturedItemType {
    return ITEM_DODO_CAGE;
}

- (void)createItemDropsForDeath {
}

- (uint64_t)creationDataStructSize {
    return 112;
}

- (NSData *)creationNetDataForClient:(NSString *)clientID {
    return nil;
}

- (void)dealloc {
    [self->bodyCube release];
    [self->neckCube release];
    [self->headCube release];
    [self->legCube release];
    [self->footCube release];

    [super dealloc];
}

- (void)die:(Blockhead *)killBlockhead_ {
}

- (void)doRemoteUpdate:(DodoUpdateNetData)updateNetData {
}

- (DodoUpdateNetData)dodoUpdateNetDataForClient:(NSString *)clientIDToSendTo {
    return DodoUpdateNetData();
}

- (void)draw:(float)dt projectionMatrix:(GLKMatrix4)projectionMatrix modelViewMatrix:(GLKMatrix4)modelViewMatrix cameraMinXWorld:(int)cameraMinXWorld cameraMaxXWorld:(int)cameraMaxXWorld cameraMinYWorld:(int)cameraMinYWorld cameraMaxYWorld:(int)cameraMaxYWorld {
}

- (ItemType)foodItemType {
    return ITEM_APPLE;
}

- (NSString **)getNamesArray {
    return nullptr;
}

- (int)getNamesArrayCount {
    return 244;
}

- (int)getRandomDirection {
    return 0;
}

- (NSMutableDictionary *)getSaveDict {
    return [super getSaveDict];
}

- (void)hitWithForce:(int)force blockhead:(Blockhead *)blockhead {
}

- (Dodo *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld_ atPosition:(intpair)pos_ cache:(CPCache *)cache_ saveDict:(NSDictionary *)saveDict isAdult:(BOOL)isAdult wasPlaced:(BOOL)wasPlaced placedByClient:(NSString *)clientId {
    return nil;
}

- (Dodo *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld cache:(CPCache *)cache_ netData:(NSData *)netData {
    return nil;
}

- (Dodo *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld saveDict:(NSDictionary *)saveDict cache:(CPCache *)cache_ {
    return nil;
}

- (void)jumpAndCluck {
}

- (BOOL)jumpsOnSwipe {
    return NO;
}

- (void)loadDerivedStuff {
}

- (float)maxAge {
    return 7200.0f;
}

- (uint16_t)maxHealth {
    return 16;
}

- (NPCType)npcType {
    return NPC_DODO;
}

- (void)reactToBeingFed {
}

- (void)reactToBeingHit {
}

- (void)remoteCreationDataUpdate:(NSData *)netData {
}

- (void)remoteUpdate:(NSData *)netData {
}

- (void)removeRider:(Blockhead *)blockhead {
    if (self->rider != blockhead) {
        return;
    }

    [super removeRider:blockhead];
    self->riderTargetVelocity = 0.0f;
}

- (Vector2)renderPos {
    return Vector2();
}

- (int)rideDirection {
    return 0;
}

- (float)riderBodyYRotationForBlockhead:(Blockhead *)blockhead {
    return self->bodyRotation;
}

- (Vector)riderPosForBlockhead:(Blockhead *)blockhead {
    return Vector();
}

- (BOOL)riderRidesWithArmsDown {
    return YES;
}

- (void)setTargetVelocity:(Vector2)targetVelocity {
}

- (NSString *)speciesName {
    return @"DODO";
}

- (void)successfulTame {
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