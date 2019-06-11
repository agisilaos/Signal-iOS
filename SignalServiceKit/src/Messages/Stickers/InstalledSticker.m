//
//  Copyright (c) 2019 Open Whisper Systems. All rights reserved.
//

#import "InstalledSticker.h"

NS_ASSUME_NONNULL_BEGIN

@implementation InstalledSticker

- (instancetype)initWithInfo:(StickerInfo *)info emojiString:(nullable NSString *)emojiString
{
    OWSAssertDebug(info.packId.length > 0);
    OWSAssertDebug(info.packKey.length > 0);

    self = [super initWithUniqueId:[InstalledSticker uniqueIdForStickerInfo:info]];

    if (!self) {
        return self;
    }

    _info = info;
    _emojiString = emojiString;

    return self;
}

- (NSData *)packId
{
    return self.info.packId;
}

- (NSData *)packKey
{
    return self.info.packKey;
}

- (UInt32)stickerId
{
    return self.info.stickerId;
}

// --- CODE GENERATION MARKER

// This snippet is generated by /Scripts/sds_codegen/sds_generate.py. Do not manually edit it, instead run `sds_codegen.sh`.

// clang-format off

- (instancetype)initWithUniqueId:(NSString *)uniqueId
                     emojiString:(nullable NSString *)emojiString
                            info:(StickerInfo *)info
{
    self = [super initWithUniqueId:uniqueId];

    if (!self) {
        return self;
    }

    _emojiString = emojiString;
    _info = info;

    return self;
}

// clang-format on

// --- CODE GENERATION MARKER

+ (NSString *)uniqueIdForStickerInfo:(StickerInfo *)info
{
    return info.asKey;
}

@end

NS_ASSUME_NONNULL_END