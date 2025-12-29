#import "CornPlant.h"

@implementation CornPlant

- (BOOL)canDieSeason:(int)season {
    return season == 7;
}

- (BOOL)floweringSeason:(int)season {
    return (season | 1) == 3;
}

- (BOOL)isRequiredSoilType:(TileType)type {
    switch (type) {
        case TILE_DIRT:
        case TILE_DIRT_GRASS:
        case TILE_DIRT_GRASS_FROZEN:
        case TILE_COMPOST:
        case TILE_COMPOST_GRASS:
        case TILE_COMPOST_GRASS_FROZEN:
            return YES;
        default:
            return NO;
    }
}

- (float)maxAgeBase {
    return 7200.0f;
}

- (int)minAllowedTemperature {
    return -10;
}

- (DynamicObjectType)objectType {
    return DYNAMIC_OBJECT_TYPE_CORN_PLANT;
}

- (PlantType)plantType {
    return PLANT_CORN;
}

- (ImageType)renderImageType {
    if (self->flowering) {
        return IMAGE_CORN_PLANT_FLOWER;
    } else {
        return IMAGE_CORN_PLANT;
    }
}

- (ItemType)seedItemType {
    return ITEM_CORN;
}

@end