#include "bft_ids_macros.hpp"
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class GVAR(ItemCore): ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        // cannot do ItemGPS as long as we do have to use magazines for unique items
        // simulation = "ItemGPS";
        GVAR(deviceType) = "";
        GVAR(magazineItem) = "";
        GVAR(prototype) = 1;
    };

    // DK10 BLUFOR
    class ACE_DK10_b: GVAR(ItemCore) {
        descriptionShort = CSTRING(DK10_itemDescription_b);
        displayName = CSTRING(DK10_itemName_b);
        model = QUOTE(PATHTOF(data\DK10.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\DK10_icon.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 40;
        };
    };
    BFT_DEVICE_IDS(ACE_DK10_b,CSTRING(DK10_itemDescription_b))

    // DK10 OPFOR
    class ACE_DK10_o: ACE_DK10_b {
        descriptionShort = CSTRING(DK10_itemDescription_o);
        displayName = CSTRING(DK10_itemName_o);
    };
    BFT_DEVICE_IDS(ACE_DK10_o,CSTRING(DK10_itemDescription_o))

    // DK10 IND
    class ACE_DK10_i: ACE_DK10_b {
        descriptionShort = CSTRING(DK10_itemDescription_i);
        displayName = CSTRING(DK10_itemName_i);
    };
    BFT_DEVICE_IDS(ACE_DK10_i,CSTRING(DK10_itemDescription_i))

    // GD300 BLUFOR
    class ACE_GD300_b: GVAR(ItemCore) {
        descriptionShort = CSTRING(GD300_itemDescription_b);
        displayName = CSTRING(GD300_itemName_b);
        model = QUOTE(PATHTOF(data\GD300.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\GD300_icon.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    BFT_DEVICE_IDS(ACE_GD300_b,CSTRING(GD300_itemDescription_b))

    // GD300 OPFOR
    class ACE_GD300_o: ACE_GD300_b {
        descriptionShort = CSTRING(GD300_itemDescription_o);
        displayName = CSTRING(GD300_itemName_o);
    };
    BFT_DEVICE_IDS(ACE_GD300_o,CSTRING(GD300_itemDescription_o))

    // GD300 IND
    class ACE_GD300_i: ACE_GD300_b {
        descriptionShort = CSTRING(GD300_itemDescription_i);
        displayName = CSTRING(GD300_itemName_i);
    };
    BFT_DEVICE_IDS(ACE_GD300_i,CSTRING(GD300_itemDescription_i))


};
