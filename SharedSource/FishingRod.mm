#import "FishingRod.h"

#import "Blockhead.h"
#import "ClownFish.h"
#import "MJSound.h"
#import "Shader.h"
#import "World.h"

@implementation FishingRod

@synthesize blockhead;
@synthesize hookPos;
@synthesize castingRight;
@synthesize hookInAir;
@synthesize castAnimationProgress;
@synthesize isInCastingAnimation;
@synthesize valid;

- (void)blockheadUnloaded:(Blockhead *)blockhead {
    if (self->blockhead == blockhead) {
        [blockhead release];
        self->blockhead = nil;
    }
}

- (Vector2)cameraPos {
    return [self->blockhead floatPos];
}

- (void)dealloc {
    if (self->verts) {
        free(self->verts);
    }

    [self->reelInSound stop];
    self->reelInSound = nil;

    [super dealloc];
}

- (void)directionalSwipe:(Vector2)vec {
}

- (void)draw:(float)dt projectionMatrix:(GLKMatrix4)projectionMatrix modelViewMatrix:(GLKMatrix4)modelViewMatrix cameraMinXWorld:(int)cameraMinXWorld cameraMaxXWorld:(int)cameraMaxXWorld cameraMinYWorld:(int)cameraMinYWorld cameraMaxYWorld:(int)cameraMaxYWorld {
}

- (ClownFish *)hookedFish {
    return self->hookedFish;
}

- (Vector2)hookedFishDirection {
    return Vector2();
}

- (id)initWithWorld:(World *)world_ blockhead:(Blockhead *)blockhead_ cache:(CPCache *)cache_ {
    return nil;
}

- (BOOL)isCasting {
    return self->casting;
}

- (void)setHookedFish:(ClownFish *)hookedFish_ {
}

- (void)setPaused:(BOOL)paused {
    if (paused) {
        [self->reelInSound pause];
    } else {
        [self->reelInSound playAtPosition:[self->blockhead floatPos]];
    }
}

- (void)update:(float)dt accurateDT:(float)accurateDT isSimulation:(BOOL)isSimulation {
}

@end