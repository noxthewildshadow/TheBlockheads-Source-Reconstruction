#import "FireObject.h"

#import "ArtificialLight.h"
#import "Shader.h"

@implementation FireObject

- (void)addArtificialLightContributionForPhysicalBlockLoadedAtXPos:(int)macroX yPos:(int)macroY {
    [self->light addContributionForPhysicalBlockLoadedAtXPos:macroX yPos:macroY];
}

- (NSData *)creationNetDataForClient:(NSString *)clientID {
    return nil;
}

- (void)dealloc {
    [self->light release];

    [super dealloc];
}

- (void)draw:(float)dt projectionMatrix:(GLKMatrix4)projectionMatrix modelViewMatrix:(GLKMatrix4)modelViewMatrix cameraMinXWorld:(int)cameraMinXWorld cameraMaxXWorld:(int)cameraMaxXWorld cameraMinYWorld:(int)cameraMinYWorld cameraMaxYWorld:(int)cameraMaxYWorld {
}

- (Vector)getLightRGB {
    return Vector();
}

- (NSMutableDictionary *)getSaveDict {
    return nil;
}

- (void)initSubDerivedItems {
}

- (FireObject *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld atPosition:(intpair)pos cache:(CPCache *)cache_ {
    return nil;
}

- (FireObject *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld cache:(CPCache *)cache_ netData:(NSData *)netData {
    return nil;
}

- (FireObject *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld saveDict:(NSDictionary *)saveDict cache:(CPCache *)cache_ {
    return nil;
}

- (DynamicObjectType)objectType {
    return DYNAMIC_OBJECT_TYPE_FIRE;
}

- (void)removeFromMacroBlock {
}

- (BOOL)requiresPhysicalBlock {
    return [self isNet] == NO;
}

- (void)setNeedsRemoved:(BOOL)needsRemoved {
    [super setNeedsRemoved:needsRemoved];

    if (needsRemoved) {
        [self->light removeFromTiles];
    }
}

- (void)update:(float)dt accurateDT:(float)accurateDT isSimulation:(BOOL)isSimulation {
}

- (NSData *)updateNetDataForClient:(NSString *)clientID {
    return [self creationNetDataForClient:clientID];
}

- (void)worldChanged:(std::vector<intpair> *)worldChangedPositions {
    [self->light worldChanged:worldChangedPositions];
}

@end