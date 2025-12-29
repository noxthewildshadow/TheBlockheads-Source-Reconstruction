#import "ChilliPlant.h"

@implementation ChilliPlant

- (BOOL)canDieSeason:(int)season {
    return season == 5;
}

- (BOOL)emitsLight {
    return YES;
}

- (BOOL)floweringSeason:(int)season {
    return (season - 1) < 2;
}

- (BOOL)isRequiredSoilType:(TileType)type {
    switch (type) {
        case TILE_DIRT:
        case TILE_DIRT_GRASS:
        case TILE_COMPOST:
        case TILE_COMPOST_GRASS:
            return YES;
        default:
            return NO;
    }
}

- (Vector)lightColor {
    return Vector();
}

- (float)lightFactor {
    return 0;
}

- (float)maxAgeBase {
    return 7200.0f;
}

- (int)minAllowedTemperature {
    return -1;
}

- (DynamicObjectType)objectType {
    return DYNAMIC_OBJECT_TYPE_CHILLI_PLANT;
}

- (PlantType)plantType {
    return PLANT_CHILLI;
}

- (ImageType)renderImageType {
    if (self->flowering) {
        return IMAGE_CHILLI_PLANT_FLOWER;
    } else {
        return IMAGE_CHILLI_PLANT;
    }
}

- (ItemType)seedItemType {
    return ITEM_CHILLI;
}

@end