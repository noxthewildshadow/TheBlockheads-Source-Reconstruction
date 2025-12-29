#import "CoconutTree.h"

@implementation CoconutTree

- (ItemType)fruitItemType {
    return ITEM_COCONUT;
}

- (BOOL)fruitShouldFallInSeason:(int)season {
    season -= 1;
    return season < 7 && (season & 1) == 0;
}

- (NSMutableDictionary *)getSaveDict {
    return [super getSaveDict];
}

- (CoconutTree *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld_ atPosition:(intpair)pos_ cache:(CPCache *)cache_ maxHeight:(int16_t)maxHeight_ growthRate:(int16_t)growthRate_ treeDensityNoiseFunction:(NoiseFunction *)treeDensityNoiseFunction_ seasonOffsetNoiseFunction:(NoiseFunction *)seasonOffsetNoiseFunction_ adultTree:(BOOL)adultTree adultMaxAge:(float)adultMaxAge {
    return nil;
}

- (CoconutTree *)initWithWorld:(World *)world_ dynamicWorld:(DynamicWorld *)dynamicWorld_ saveDict:(NSMutableDictionary *)saveDict cache:(CPCache *)cache_ treeDensityNoiseFunction:(NoiseFunction *)treeDensityNoiseFunction_ seasonOffsetNoiseFunction:(NoiseFunction *)seasonOffsetNoiseFunction_ {
    return nil;
}

- (BOOL)isRequiredSoilType:(TileType)type {
    switch (type) {
        case TILE_DIRT:
        case TILE_DIRT_GRASS:
        case TILE_SAND_BEACH:
        case TILE_BLACK_SAND:
        case TILE_COMPOST:
        case TILE_COMPOST_GRASS:
            return YES;
        default:
            return NO;
    }
}

- (void)loadSaveDictValues:(NSDictionary *)saveDict {
    [super loadSaveDictValues:saveDict];
}

- (void)makeTileDead:(Tile *)tile {
    if (tile->contents == CONTENTS_COCONUT_TREE_BUSH) {
        tile->contents = CONTENTS_COCONUT_TREE_BUSH_DEAD;
    } else if (tile->contents == CONTENTS_COCONUT_TREE_TRUNK || tile->contents == CONTENTS_COCONUT_TREE_TRUNK_BUSH) {
        tile->contents = CONTENTS_COCONUT_TREE_TRUNK_DEAD;
    }
}

- (DynamicObjectType)objectType {
    return DYNAMIC_OBJECT_TYPE_COCONUT_TREE;
}

- (BOOL)tileIsKindOfSelf:(Tile *)tile {
    switch (tile->contents) {
        case CONTENTS_COCONUT_TREE_BUSH:
        case CONTENTS_COCONUT_TREE_TRUNK:
        case CONTENTS_COCONUT_TREE_TRUNK_BUSH:
        case CONTENTS_COCONUT_TREE_TRUNK_DEAD:
        case CONTENTS_COCONUT_TREE_BUSH_DEAD:
            return YES;
        default:
            return NO;
    }
}

- (TreeType)treeType {
    return TREE_COCONUT;
}

- (void)update:(float)dt accurateDT:(float)accurateDT isSimulation:(BOOL)isSimulation {
}

- (void)updateGrowth:(BOOL)addNewBranchBlocks {
}

@end