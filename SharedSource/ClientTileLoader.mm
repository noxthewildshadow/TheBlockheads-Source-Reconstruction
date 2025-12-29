#import "ClientTileLoader.h"

#import "BHClient.h"
#import "NoiseFunction.h"

@implementation ClientTileLoader

- (void)blockDataNotLoadedOnServer:(uint32_t)macroIndex {
}

- (void)blockDataRecievedFromServer:(NSData *)blockData {
}

- (void)dealloc {
    [self->heightNoiseFunctionA release];
    [self->heightNoiseFunctionB release];
    [self->sandNoiseFunction release];
    [self->faultNoiseFunction release];
    [self->caveNoiseFunctionA release];
    [self->caveNoiseFunctionB release];
    [self->flintDensityNoiseFunction release];
    [self->flintDensityNoiseFunctionLegacy release];
    free(self->dirtHeights);
    free(self->rockHeights);
    [self->blockRequestDates release];
    [self deleteTimers];
    [self->blockDirectory release];

    [super dealloc];
}

- (void)deleteTimers {
    self->world = nil;
}

- (FoodType *)distanceOrderedFoodTypes {
    return self->distanceOrderedFoodTypes;
}

- (int)faultOffsetForX:(int)x y:(int)y {
    return 0;
}

- (void)getInitialRockAndDirtHeightforX:(int)x rockHeight:(float *)rockHeight dirtHeight:(float *)dirtHeight {
}

- (void)getRockAndDirtHeightforX:(int)x rockHeight:(int *)rockHeight dirtHeight:(int *)dirtHeight {
}

- (ClientTileLoader *)initWithWorld:(World *)world_ client:(BHClient *)client_ saveID:(NSString *)saveID_ randomSeed:(int)randomSeed cameraPos:(intpair)cameraPos {
    return nil;
}

- (void)initialDataRecievedFromServer:(NSData *)initialData {
    memcpy(self->distanceOrderedFoodTypes, [initialData bytes], [initialData length]);
    self->hasDistanceOrderedFoodTypes = YES;
}

- (BOOL)isCaveForX:(int)x y:(int)y faultOffset:(int)faultOffset {
    return NO;
}

- (void)lightBlockDataRecievedFromServer:(NSData *)blockData {
}

- (void)loadPhysicalBlock:(PhysicalBlock *)physicalBlock atPos:(intpair)pos withTilesData:(NSData *)tilesData lightData:(NSData *)lightData extraDataDict:(NSDictionary *)extraDataDict {
}

- (int)maxOfRockAndDirtHeightForX:(int)x {
    return 0;
}

- (void)requestBlockFromServerAtPos:(intpair)pos createIfNotCreated:(BOOL)createIfNotCreated {
}

- (float)sandFractionForPos:(intpair)worldPos height:(int)height highRes:(BOOL)highRes {
    return 0;
}

- (float)sandFractionForPos:(intpair)worldPos highRes:(BOOL)highRes {
    return 0;
}

- (BOOL)shouldBeCrystalBlockAtX:(int)x y:(int)y {
    return NO;
}

- (int)unmodifiedGroundLevelForX:(int)x {
    return 0;
}

- (void)updateQueue {
}

- (BOOL)waitingForBlocks {
    return !self->sentBlockRequests.empty();
}

- (int)waitingForBlocksCount {
    return static_cast<int>(self->sentBlockRequests.size());
}

- (BOOL)waitingForFoodTypes {
    return self->hasDistanceOrderedFoodTypes == NO;
}

@end
