// To parse this JSON data, do
//
//     final userIdStory = userIdStoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserStory userIdStoryFromJson(String str) => UserStory.fromJson(json.decode(str));

String userIdStoryToJson(UserStory data) => json.encode(data.toJson());

class UserStory {
    UserStory({
        required this.broadcast,
        required this.reel,
        required this.status,
    });

    dynamic broadcast;
    Reel ?reel;
    String ?status;

    factory UserStory.fromJson(Map<String, dynamic> json) => UserStory(
        broadcast: json["broadcast"],
        reel: json["reel"] == null ? null : Reel.fromJson(json["reel"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "broadcast": broadcast,
        "reel": reel == null ? null : reel!.toJson(),
        "status": status,
    };
}

class Reel {
    Reel({
        required this.id,
        required this.latestReelMedia,
        required this.expiringAt,
        required this.seen,
        required this.canReply,
        required this.canGifQuickReply,
        required this.canReshare,
        required this.canReactWithAvatar,
        required this.reelType,
        required this.adExpiryTimestampInMillis,
        required this.isCtaStickerAvailable,
        required this.user,
        required this.items,
        required this.prefetchCount,
        required this.hasBestiesMedia,
        required this.mediaCount,
        required this.mediaIds,
        required this.hasFanClubMedia,
        required this.disabledReplyTypes,
    });

    String ?id;
    int ?latestReelMedia;
    int ?expiringAt;
    int ?seen;
    bool ?canReply;
    bool ?canGifQuickReply;
    bool ?canReshare;
    bool ?canReactWithAvatar;
    String ?reelType;
    dynamic adExpiryTimestampInMillis;
    dynamic isCtaStickerAvailable;
    ReelUser ?user;
    List<Item> ?items;
    int ?prefetchCount;
    bool ?hasBestiesMedia;
    int ?mediaCount;
    List<String>? mediaIds;
    bool ?hasFanClubMedia;
    List<String> ?disabledReplyTypes;

    factory Reel.fromJson(Map<String, dynamic> json) => Reel(
        id: json["id"],
        latestReelMedia: json["latest_reel_media"],
        expiringAt: json["expiring_at"],
        seen: json["seen"],
        canReply: json["can_reply"],
        canGifQuickReply: json["can_gif_quick_reply"],
        canReshare: json["can_reshare"],
        canReactWithAvatar: json["can_react_with_avatar"],
        reelType: json["reel_type"],
        adExpiryTimestampInMillis: json["ad_expiry_timestamp_in_millis"],
        isCtaStickerAvailable: json["is_cta_sticker_available"],
        user: json["user"] == null ? null : ReelUser.fromJson(json["user"]),
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        prefetchCount: json["prefetch_count"],
        hasBestiesMedia: json["has_besties_media"],
        mediaCount: json["media_count"],
        mediaIds: json["media_ids"] == null ? null : List<String>.from(json["media_ids"].map((x) => x)),
        hasFanClubMedia: json["has_fan_club_media"],
        disabledReplyTypes: json["disabled_reply_types"] == null ? null : List<String>.from(json["disabled_reply_types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latest_reel_media": latestReelMedia,
        "expiring_at": expiringAt,
        "seen": seen,
        "can_reply": canReply,
        "can_gif_quick_reply": canGifQuickReply,
        "can_reshare": canReshare,
        "can_react_with_avatar": canReactWithAvatar,
        "reel_type": reelType,
        "ad_expiry_timestamp_in_millis": adExpiryTimestampInMillis,
        "is_cta_sticker_available": isCtaStickerAvailable,
        "user": user == null ? null : user!.toJson(),
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
        "prefetch_count": prefetchCount,
        "has_besties_media": hasBestiesMedia,
        "media_count": mediaCount,
        "media_ids": mediaIds == null ? null : List<dynamic>.from(mediaIds!.map((x) => x)),
        "has_fan_club_media": hasFanClubMedia,
        "disabled_reply_types": disabledReplyTypes == null ? null : List<dynamic>.from(disabledReplyTypes!.map((x) => x)),
    };
}

class Item {
    Item({
        required this.takenAt,
        required this.pk,
        required this.id,
        required this.deviceTimestamp,
        required this.mediaType,
        required this.code,
        required this.clientCacheKey,
        required this.filterType,
        required this.isUnifiedVideo,
        required this.shouldRequestAds,
        required this.originalMediaHasVisualReplyMedia,
        required this.captionIsEdited,
        required this.likeAndViewCountsDisabled,
        required this.commercialityStatus,
        required this.isPaidPartnership,
        required this.isVisualReplyCommenterNoticeEnabled,
        required this.clipsTabPinnedUserIds,
        required this.hasDelayedMetadata,
        required this.fundraiserTag,
        required this.captionPosition,
        required this.isReelMedia,
        required this.photoOfYou,
        required this.isOrganicProductTaggingEligible,
        required this.canSeeInsightsAsBrand,
        required this.user,
        required this.imageVersions2,
        required this.originalWidth,
        required this.originalHeight,
        required this.caption,
        required this.commentInformTreatment,
        required this.sharingFrictionInfo,
        required this.canViewerSave,
        required this.isInProfileGrid,
        required this.profileGridControlEnabled,
        required this.organicTrackingToken,
        required this.expiringAt,
        required this.importedTakenAt,
        required this.hasSharedToFb,
        required this.productType,
        required this.deletedReason,
        required this.integrityReviewDecision,
        required this.commerceIntegrityReviewDecision,
        required this.musicMetadata,
        required this.isArtistPick,
        required this.canReshare,
        required this.canReply,
        required this.canSendPrompt,
        required this.isFirstTake,
        required this.isRollcallV2,
        required this.createdFromAddYoursBrowsing,
        required this.storyStaticModels,
        required this.supportsReelReactions,
        required this.canSendCustomEmojis,
        required this.showOneTapFbShareTooltip,
        required this.isDashEligible,
        required this.videoDashManifest,
        required this.videoCodec,
        required this.numberOfQualities,
        required this.videoVersions,
        required this.hasAudio,
        required this.videoDuration,
        required this.storyLinkStickers,
        required this.storyFeedMedia,
    });

    int ?takenAt;
    String pk;
    String ?id;
    int ?deviceTimestamp;
    int ?mediaType;
    String ?code;
    String ?clientCacheKey;
    int ?filterType;
    bool ?isUnifiedVideo;
    bool ?shouldRequestAds;
    bool ?originalMediaHasVisualReplyMedia;
    bool ?captionIsEdited;
    bool ?likeAndViewCountsDisabled;
    CommercialityStatus ?commercialityStatus;
    bool? isPaidPartnership;
    bool? isVisualReplyCommenterNoticeEnabled;
    List<dynamic>? clipsTabPinnedUserIds;
    bool? hasDelayedMetadata;
    FundraiserTag? fundraiserTag;
    double? captionPosition;
    bool ?isReelMedia;
    bool? photoOfYou;
    bool ?isOrganicProductTaggingEligible;
    bool ?canSeeInsightsAsBrand;
    ItemUser? user;
    ImageVersions2? imageVersions2;
    int? originalWidth;
    int? originalHeight;
    dynamic caption;
    CommentInformTreatment? commentInformTreatment;
    SharingFrictionInfo ?sharingFrictionInfo;
    bool ?canViewerSave;
    bool ?isInProfileGrid;
    bool? profileGridControlEnabled;
    String ?organicTrackingToken;
    int ?expiringAt;
    int? importedTakenAt;
    int ?hasSharedToFb;
    ProductType ?productType;
    int ?deletedReason;
    IntegrityReviewDecision? integrityReviewDecision;
    dynamic commerceIntegrityReviewDecision;
    dynamic musicMetadata;
    bool ?isArtistPick;
    bool ?canReshare;
    bool ?canReply;
    bool ?canSendPrompt;
    bool ?isFirstTake;
    bool ?isRollcallV2;
    bool ?createdFromAddYoursBrowsing;
    List<dynamic>? storyStaticModels;
    bool? supportsReelReactions;
    bool? canSendCustomEmojis;
    bool? showOneTapFbShareTooltip;
    int? isDashEligible;
    String? videoDashManifest;
    VideoCodec? videoCodec;
    int ?numberOfQualities;
    List<VideoVersion>? videoVersions;
    bool? hasAudio;
    double? videoDuration;
    List<StoryLinkSticker>? storyLinkStickers;
    List<StoryFeedMedia>? storyFeedMedia;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        takenAt: json["taken_at"],
        pk: json["pk"] == null ? null : json["pk"],
        id: json["id"],
        deviceTimestamp: json["device_timestamp"],
        mediaType: json["media_type"],
        code: json["code"],
        clientCacheKey: json["client_cache_key"],
        filterType: json["filter_type"],
        isUnifiedVideo: json["is_unified_video"],
        shouldRequestAds: json["should_request_ads"],
        originalMediaHasVisualReplyMedia: json["original_media_has_visual_reply_media"],
        captionIsEdited: json["caption_is_edited"],
        likeAndViewCountsDisabled: json["like_and_view_counts_disabled"],
        commercialityStatus: json["commerciality_status"] == null ? null : commercialityStatusValues.map![json["commerciality_status"]],
        isPaidPartnership: json["is_paid_partnership"],
        isVisualReplyCommenterNoticeEnabled: json["is_visual_reply_commenter_notice_enabled"],
        clipsTabPinnedUserIds: json["clips_tab_pinned_user_ids"] == null ? null : List<dynamic>.from(json["clips_tab_pinned_user_ids"].map((x) => x)),
        hasDelayedMetadata: json["has_delayed_metadata"],
        fundraiserTag: json["fundraiser_tag"] == null ? null : FundraiserTag.fromJson(json["fundraiser_tag"]),
        captionPosition: json["caption_position"],
        isReelMedia: json["is_reel_media"],
        photoOfYou: json["photo_of_you"],
        isOrganicProductTaggingEligible: json["is_organic_product_tagging_eligible"],
        canSeeInsightsAsBrand: json["can_see_insights_as_brand"],
        user: json["user"] == null ? null : ItemUser.fromJson(json["user"]),
        imageVersions2: json["image_versions2"] == null ? null : ImageVersions2.fromJson(json["image_versions2"]),
        originalWidth: json["original_width"],
        originalHeight: json["original_height"],
        caption: json["caption"],
        commentInformTreatment: json["comment_inform_treatment"] == null ? null : CommentInformTreatment.fromJson(json["comment_inform_treatment"]),
        sharingFrictionInfo: json["sharing_friction_info"] == null ? null : SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        canViewerSave: json["can_viewer_save"],
        isInProfileGrid: json["is_in_profile_grid"],
        profileGridControlEnabled: json["profile_grid_control_enabled"],
        organicTrackingToken: json["organic_tracking_token"],
        expiringAt: json["expiring_at"],
        importedTakenAt: json["imported_taken_at"],
        hasSharedToFb: json["has_shared_to_fb"],
        productType: json["product_type"] == null ? null : productTypeValues.map![json["product_type"]],
        deletedReason: json["deleted_reason"],
        integrityReviewDecision: json["integrity_review_decision"] == null ? null : integrityReviewDecisionValues.map![json["integrity_review_decision"]],
        commerceIntegrityReviewDecision: json["commerce_integrity_review_decision"],
        musicMetadata: json["music_metadata"],
        isArtistPick: json["is_artist_pick"],
        canReshare: json["can_reshare"],
        canReply: json["can_reply"],
        canSendPrompt: json["can_send_prompt"],
        isFirstTake: json["is_first_take"],
        isRollcallV2: json["is_rollcall_v2"],
        createdFromAddYoursBrowsing: json["created_from_add_yours_browsing"],
        storyStaticModels: json["story_static_models"] == null ? null : List<dynamic>.from(json["story_static_models"].map((x) => x)),
        supportsReelReactions: json["supports_reel_reactions"],
        canSendCustomEmojis: json["can_send_custom_emojis"],
        showOneTapFbShareTooltip: json["show_one_tap_fb_share_tooltip"],
        isDashEligible: json["is_dash_eligible"],
        videoDashManifest: json["video_dash_manifest"],
        videoCodec: json["video_codec"] == null ? null : videoCodecValues.map![json["video_codec"]],
        numberOfQualities: json["number_of_qualities"],
        videoVersions: json["video_versions"] == null ? null : List<VideoVersion>.from(json["video_versions"].map((x) => VideoVersion.fromJson(x))),
        hasAudio: json["has_audio"],
        videoDuration: json["video_duration"] == null ? null : json["video_duration"].toDouble(),
        storyLinkStickers: json["story_link_stickers"] == null ? null : List<StoryLinkSticker>.from(json["story_link_stickers"].map((x) => StoryLinkSticker.fromJson(x))),
        storyFeedMedia: json["story_feed_media"] == null ? null : List<StoryFeedMedia>.from(json["story_feed_media"].map((x) => StoryFeedMedia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "taken_at": takenAt,
        "pk": pk,
        "id": id,
        "device_timestamp": deviceTimestamp,
        "media_type": mediaType,
        "code": code,
        "client_cache_key": clientCacheKey,
        "filter_type": filterType,
        "is_unified_video": isUnifiedVideo,
        "should_request_ads": shouldRequestAds,
        "original_media_has_visual_reply_media": originalMediaHasVisualReplyMedia,
        "caption_is_edited": captionIsEdited,
        "like_and_view_counts_disabled": likeAndViewCountsDisabled,
        "commerciality_status": commercialityStatus == null ? null : commercialityStatusValues.reverse![commercialityStatus],
        "is_paid_partnership": isPaidPartnership,
        "is_visual_reply_commenter_notice_enabled": isVisualReplyCommenterNoticeEnabled,
        "clips_tab_pinned_user_ids": clipsTabPinnedUserIds == null ? null : List<dynamic>.from(clipsTabPinnedUserIds!.map((x) => x)),
        "has_delayed_metadata": hasDelayedMetadata,
        "fundraiser_tag": fundraiserTag == null ? null : fundraiserTag!.toJson(),
        "caption_position": captionPosition,
        "is_reel_media": isReelMedia,
        "photo_of_you": photoOfYou,
        "is_organic_product_tagging_eligible": isOrganicProductTaggingEligible,
        "can_see_insights_as_brand": canSeeInsightsAsBrand,
        "user": user == null ? null : user!.toJson(),
        "image_versions2": imageVersions2 == null ? null : imageVersions2!.toJson(),
        "original_width": originalWidth,
        "original_height": originalHeight,
        "caption": caption,
        "comment_inform_treatment": commentInformTreatment == null ? null : commentInformTreatment!.toJson(),
        "sharing_friction_info": sharingFrictionInfo == null ? null : sharingFrictionInfo!.toJson(),
        "can_viewer_save": canViewerSave,
        "is_in_profile_grid": isInProfileGrid,
        "profile_grid_control_enabled": profileGridControlEnabled,
        "organic_tracking_token": organicTrackingToken,
        "expiring_at": expiringAt,
        "imported_taken_at": importedTakenAt,
        "has_shared_to_fb": hasSharedToFb,
        "product_type": productType == null ? null : productTypeValues.reverse![productType],
        "deleted_reason": deletedReason,
        "integrity_review_decision": integrityReviewDecision == null ? null : integrityReviewDecisionValues.reverse![integrityReviewDecision],
        "commerce_integrity_review_decision": commerceIntegrityReviewDecision,
        "music_metadata": musicMetadata,
        "is_artist_pick": isArtistPick,
        "can_reshare": canReshare,
        "can_reply": canReply,
        "can_send_prompt": canSendPrompt,
        "is_first_take": isFirstTake,
        "is_rollcall_v2": isRollcallV2,
        "created_from_add_yours_browsing": createdFromAddYoursBrowsing,
        "story_static_models": storyStaticModels == null ? null : List<dynamic>.from(storyStaticModels!.map((x) => x)),
        "supports_reel_reactions": supportsReelReactions,
        "can_send_custom_emojis": canSendCustomEmojis,
        "show_one_tap_fb_share_tooltip": showOneTapFbShareTooltip,
        "is_dash_eligible": isDashEligible,
        "video_dash_manifest": videoDashManifest,
        "video_codec": videoCodec == null ? null : videoCodecValues.reverse![videoCodec],
        "number_of_qualities": numberOfQualities,
        "video_versions": videoVersions == null ? null : List<dynamic>.from(videoVersions!.map((x) => x.toJson())),
        "has_audio": hasAudio,
        "video_duration": videoDuration,
        "story_link_stickers": storyLinkStickers == null ? null : List<dynamic>.from(storyLinkStickers!.map((x) => x.toJson())),
        "story_feed_media": storyFeedMedia == null ? null : List<dynamic>.from(storyFeedMedia!.map((x) => x.toJson())),
    };
}

class CommentInformTreatment {
    CommentInformTreatment({
        required this.shouldHaveInformTreatment,
        required this.text,
        required this.url,
        required this.actionType,
    });

    bool ?shouldHaveInformTreatment;
    String ?text;
    dynamic url;
    dynamic actionType;

    factory CommentInformTreatment.fromJson(Map<String, dynamic> json) => CommentInformTreatment(
        shouldHaveInformTreatment: json["should_have_inform_treatment"],
        text: json["text"],
        url: json["url"],
        actionType: json["action_type"],
    );

    Map<String, dynamic> toJson() => {
        "should_have_inform_treatment": shouldHaveInformTreatment,
        "text": text,
        "url": url,
        "action_type": actionType,
    };
}

enum CommercialityStatus { NOT_COMMERCIAL }

final commercialityStatusValues = EnumValues({
    "not_commercial": CommercialityStatus.NOT_COMMERCIAL
});

class FundraiserTag {
    FundraiserTag({
        required this.hasStandaloneFundraiser,
    });

    bool ?hasStandaloneFundraiser;

    factory FundraiserTag.fromJson(Map<String, dynamic> json) => FundraiserTag(
        hasStandaloneFundraiser: json["has_standalone_fundraiser"],
    );

    Map<String, dynamic> toJson() => {
        "has_standalone_fundraiser": hasStandaloneFundraiser,
    };
}

class ImageVersions2 {
    ImageVersions2({
        required this.candidates,
    });

    List<Candidate> ?candidates;

    factory ImageVersions2.fromJson(Map<String, dynamic> json) => ImageVersions2(
        candidates: json["candidates"] == null ? null : List<Candidate>.from(json["candidates"].map((x) => Candidate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "candidates": candidates == null ? null : List<dynamic>.from(candidates!.map((x) => x.toJson())),
    };
}

class Candidate {
    Candidate({
        required this.width,
        required this.height,
        required this.url,
        required this.scansProfile,
        required this.estimatedScansSizes,
    });

    int? width;
    int? height;
    String ?url;
    ScansProfile ?scansProfile;
    List<int>? estimatedScansSizes;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        scansProfile: json["scans_profile"] == null ? null : scansProfileValues.map![json["scans_profile"]],
        estimatedScansSizes: json["estimated_scans_sizes"] == null ? null : List<int>.from(json["estimated_scans_sizes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "scans_profile": scansProfile == null ? null : scansProfileValues.reverse![scansProfile],
        "estimated_scans_sizes": estimatedScansSizes == null ? null : List<dynamic>.from(estimatedScansSizes!.map((x) => x)),
    };
}

enum ScansProfile { E35, E15 }

final scansProfileValues = EnumValues({
    "e15": ScansProfile.E15,
    "e35": ScansProfile.E35
});

enum IntegrityReviewDecision { PENDING }

final integrityReviewDecisionValues = EnumValues({
    "pending": IntegrityReviewDecision.PENDING
});

enum ProductType { STORY }

final productTypeValues = EnumValues({
    "story": ProductType.STORY
});

class SharingFrictionInfo {
    SharingFrictionInfo({
        required this.shouldHaveSharingFriction,
        required this.bloksAppUrl,
        required this.sharingFrictionPayload,
    });

    bool ?shouldHaveSharingFriction;
    dynamic bloksAppUrl;
    dynamic sharingFrictionPayload;

    factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) => SharingFrictionInfo(
        shouldHaveSharingFriction: json["should_have_sharing_friction"],
        bloksAppUrl: json["bloks_app_url"],
        sharingFrictionPayload: json["sharing_friction_payload"],
    );

    Map<String, dynamic> toJson() => {
        "should_have_sharing_friction": shouldHaveSharingFriction,
        "bloks_app_url": bloksAppUrl,
        "sharing_friction_payload": sharingFrictionPayload,
    };
}

class StoryFeedMedia {
    StoryFeedMedia({
        required this.x,
        required this.y,
        required this.z,
        required this.width,
        required this.height,
        required this.rotation,
        required this.isPinned,
        required this.isHidden,
        required this.isSticker,
        required this.isFbSticker,
        required this.mediaId,
        required this.productType,
        required this.mediaCode,
        required this.clipsCreationEntryPoint,
    });

    double ?x;
    double ?y;
    int ?z;
    double ?width;
    double ?height;
    double ?rotation;
    int? isPinned;
    int? isHidden;
    int ?isSticker;
    int? isFbSticker;
    String ?mediaId;
    String ?productType;
    String ?mediaCode;
    String ?clipsCreationEntryPoint;

    factory StoryFeedMedia.fromJson(Map<String, dynamic> json) => StoryFeedMedia(
        x: json["x"] == null ? null : json["x"].toDouble(),
        y: json["y"] == null ? null : json["y"].toDouble(),
        z: json["z"],
        width: json["width"] == null ? null : json["width"].toDouble(),
        height: json["height"] == null ? null : json["height"].toDouble(),
        rotation: json["rotation"],
        isPinned: json["is_pinned"],
        isHidden: json["is_hidden"],
        isSticker: json["is_sticker"],
        isFbSticker: json["is_fb_sticker"],
        mediaId: json["media_id"],
        productType: json["product_type"],
        mediaCode: json["media_code"],
        clipsCreationEntryPoint: json["clips_creation_entry_point"],
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
        "z": z,
        "width": width,
        "height": height,
        "rotation": rotation,
        "is_pinned": isPinned,
        "is_hidden": isHidden,
        "is_sticker": isSticker,
        "is_fb_sticker": isFbSticker,
        "media_id": mediaId,
        "product_type": productType,
        "media_code": mediaCode,
        "clips_creation_entry_point": clipsCreationEntryPoint,
    };
}

class StoryLinkSticker {
    StoryLinkSticker({
        required this.x,
        required this.y,
        required this.z,
        required this.width,
        required this.height,
        required this.rotation,
        required this.isPinned,
        required this.isHidden,
        required this.isSticker,
        required this.isFbSticker,
        required this.storyLink,
    });

    double ?x;
    double? y;
    int ?z;
    double? width;
    double? height;
    int ?rotation;
    int ?isPinned;
    int ?isHidden;
    int ?isSticker;
    int ?isFbSticker;
    StoryLink ?storyLink;

    factory StoryLinkSticker.fromJson(Map<String, dynamic> json) => StoryLinkSticker(
        x: json["x"] == null ? null : json["x"].toDouble(),
        y: json["y"] == null ? null : json["y"].toDouble(),
        z: json["z"],
        width: json["width"] == null ? null : json["width"].toDouble(),
        height: json["height"] == null ? null : json["height"].toDouble(),
        rotation: json["rotation"],
        isPinned: json["is_pinned"],
        isHidden: json["is_hidden"],
        isSticker: json["is_sticker"],
        isFbSticker: json["is_fb_sticker"],
        storyLink: json["story_link"] == null ? null : StoryLink.fromJson(json["story_link"]),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
        "z": z,
        "width": width,
        "height": height,
        "rotation": rotation,
        "is_pinned": isPinned,
        "is_hidden": isHidden,
        "is_sticker": isSticker,
        "is_fb_sticker": isFbSticker,
        "story_link": storyLink == null ? null : storyLink!.toJson(),
    };
}

class StoryLink {
    StoryLink({
        required this.linkType,
        required this.url,
        required this.linkTitle,
        required this.displayUrl,
    });

    String? linkType;
    String? url;
    String? linkTitle;
    String? displayUrl;

    factory StoryLink.fromJson(Map<String, dynamic> json) => StoryLink(
        linkType: json["link_type"],
        url: json["url"],
        linkTitle: json["link_title"],
        displayUrl: json["display_url"],
    );

    Map<String, dynamic> toJson() => {
        "link_type": linkType,
        "url": url,
        "link_title": linkTitle,
        "display_url": displayUrl,
    };
}

class ItemUser {
    ItemUser({
        required this.pk,
        required this.username,
        required this.isVerified,
        required this.profilePicId,
        required this.profilePicUrl,
        required this.pkId,
        required this.isPrivate,
        required this.fullName,
        required this.hasAnonymousProfilePicture,
        required this.accountBadges,
        required this.fanClubInfo,
        required this.transparencyProductEnabled,
        required this.isFavorite,
        required this.isUnpublished,
        required this.showAccountTransparencyDetails,
    });

    String? pk;
    Username? username;
    bool? isVerified;
    ProfilePicId? profilePicId;
    String? profilePicUrl;
    String? pkId;
    bool? isPrivate;
    FullName ?fullName;
    bool? hasAnonymousProfilePicture;
    List<dynamic>? accountBadges;
    FanClubInfo? fanClubInfo;
    bool? transparencyProductEnabled;
    bool? isFavorite;
    bool? isUnpublished;
    bool ?showAccountTransparencyDetails;

    factory ItemUser.fromJson(Map<String, dynamic> json) => ItemUser(
        pk: json["pk"],
        username: json["username"] == null ? null : usernameValues.map![json["username"]],
        isVerified: json["is_verified"],
        profilePicId: json["profile_pic_id"] == null ? null : profilePicIdValues.map![json["profile_pic_id"]],
        profilePicUrl: json["profile_pic_url"],
        pkId: json["pk_id"],
        isPrivate: json["is_private"],
        fullName: json["full_name"] == null ? null : fullNameValues.map![json["full_name"]],
        hasAnonymousProfilePicture: json["has_anonymous_profile_picture"],
        accountBadges: json["account_badges"] == null ? null : List<dynamic>.from(json["account_badges"].map((x) => x)),
        fanClubInfo: json["fan_club_info"] == null ? null : FanClubInfo.fromJson(json["fan_club_info"]),
        transparencyProductEnabled: json["transparency_product_enabled"],
        isFavorite: json["is_favorite"],
        isUnpublished: json["is_unpublished"],
        showAccountTransparencyDetails: json["show_account_transparency_details"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "username": username == null ? null : usernameValues.reverse![username],
        "is_verified": isVerified,
        "profile_pic_id": profilePicId == null ? null : profilePicIdValues.reverse![profilePicId],
        "profile_pic_url": profilePicUrl,
        "pk_id": pkId,
        "is_private": isPrivate,
        "full_name": fullName == null ? null : fullNameValues.reverse![fullName],
        "has_anonymous_profile_picture": hasAnonymousProfilePicture,
        "account_badges": accountBadges == null ? null : List<dynamic>.from(accountBadges!.map((x) => x)),
        "fan_club_info": fanClubInfo == null ? null : fanClubInfo!.toJson(),
        "transparency_product_enabled": transparencyProductEnabled,
        "is_favorite": isFavorite,
        "is_unpublished": isUnpublished,
        "show_account_transparency_details": showAccountTransparencyDetails,
    };
}

class FanClubInfo {
    FanClubInfo({
        required this.fanClubId,
        required this.fanClubName,
        required this.isFanClubReferralEligible,
        required this.fanConsiderationPageRevampEligiblity,
        required this.isFanClubGiftingEligible,
    });

    dynamic fanClubId;
    dynamic fanClubName;
    dynamic isFanClubReferralEligible;
    dynamic fanConsiderationPageRevampEligiblity;
    dynamic isFanClubGiftingEligible;

    factory FanClubInfo.fromJson(Map<String, dynamic> json) => FanClubInfo(
        fanClubId: json["fan_club_id"],
        fanClubName: json["fan_club_name"],
        isFanClubReferralEligible: json["is_fan_club_referral_eligible"],
        fanConsiderationPageRevampEligiblity: json["fan_consideration_page_revamp_eligiblity"],
        isFanClubGiftingEligible: json["is_fan_club_gifting_eligible"],
    );

    Map<String, dynamic> toJson() => {
        "fan_club_id": fanClubId,
        "fan_club_name": fanClubName,
        "is_fan_club_referral_eligible": isFanClubReferralEligible,
        "fan_consideration_page_revamp_eligiblity": fanConsiderationPageRevampEligiblity,
        "is_fan_club_gifting_eligible": isFanClubGiftingEligible,
    };
}

enum FullName { AHMET_SONU }

final fullNameValues = EnumValues({
    "Ahmet Sonuç": FullName.AHMET_SONU
});

enum ProfilePicId { THE_29882798906177397522273541972 }

final profilePicIdValues = EnumValues({
    "2988279890617739752_2273541972": ProfilePicId.THE_29882798906177397522273541972
});

enum Username { JAHREIN }

final usernameValues = EnumValues({
    "jahrein": Username.JAHREIN
});

enum VideoCodec { AVC1_64001_E }

final videoCodecValues = EnumValues({
    "avc1.64001E": VideoCodec.AVC1_64001_E
});

class VideoVersion {
    VideoVersion({
        required this.type,
        required this.width,
        required this.height,
        required this.url,
        required this.id,
    });

    int ?type;
    int? width;
    int ?height;
    String ?url;
    String ?id;

    factory VideoVersion.fromJson(Map<String, dynamic> json) => VideoVersion(
        type: json["type"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "width": width,
        "height": height,
        "url": url,
        "id": id,
    };
}

class ReelUser {
    ReelUser({
        required this.pk,
        required this.username,
        required this.isVerified,
        required this.friendshipStatus,
        required this.profilePicId,
        required this.profilePicUrl,
        required this.pkId,
        required this.isPrivate,
        required this.fullName,
    });

    String? pk;
    String? username;
    bool? isVerified;
    FriendshipStatus? friendshipStatus;
    ProfilePicId? profilePicId;
    String? profilePicUrl;
    String? pkId;
    bool? isPrivate;
    String? fullName;

    factory ReelUser.fromJson(Map<String, dynamic> json) => ReelUser(
        pk: json["pk"],
        username: json["username"],
        isVerified: json["is_verified"],
        friendshipStatus: json["friendship_status"] == null ? null : FriendshipStatus.fromJson(json["friendship_status"]),
        profilePicId: json["profile_pic_id"] == null ? null : profilePicIdValues.map![json["profile_pic_id"]],
        profilePicUrl: json["profile_pic_url"],
        pkId: json["pk_id"],
        isPrivate: json["is_private"],
        fullName: json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "username": username == null ? null : usernameValues.reverse![username],
        "is_verified": isVerified,
        "friendship_status": friendshipStatus == null ? null : friendshipStatus!.toJson(),
        "profile_pic_id": profilePicId == null ? null : profilePicIdValues.reverse![profilePicId],
        "profile_pic_url": profilePicUrl,
        "pk_id": pkId,
        "is_private": isPrivate,
        "full_name": fullName == null ? null : fullNameValues.reverse![fullName],
    };
}

class FriendshipStatus {
    FriendshipStatus({
        required this.following,
        required this.followedBy,
        required this.blocking,
        required this.muting,
        required this.isPrivate,
        required this.incomingRequest,
        required this.outgoingRequest,
        required this.isBestie,
        required this.isRestricted,
        required this.isFeedFavorite,
    });

    bool ?following;
    bool ?followedBy;
    bool? blocking;
    bool? muting;
    bool? isPrivate;
    bool? incomingRequest;
    bool? outgoingRequest;
    bool? isBestie;
    bool? isRestricted;
    bool? isFeedFavorite;

    factory FriendshipStatus.fromJson(Map<String, dynamic> json) => FriendshipStatus(
        following: json["following"],
        followedBy: json["followed_by"],
        blocking: json["blocking"],
        muting: json["muting"],
        isPrivate: json["is_private"],
        incomingRequest: json["incoming_request"],
        outgoingRequest: json["outgoing_request"],
        isBestie: json["is_bestie"],
        isRestricted: json["is_restricted"],
        isFeedFavorite: json["is_feed_favorite"],
    );

    Map<String, dynamic> toJson() => {
        "following": following,
        "followed_by": followedBy,
        "blocking": blocking,
        "muting": muting,
        "is_private": isPrivate,
        "incoming_request": incomingRequest,
        "outgoing_request": outgoingRequest,
        "is_bestie": isBestie,
        "is_restricted": isRestricted,
        "is_feed_favorite": isFeedFavorite,
    };
}

class EnumValues<T> {
    Map<String, T> ?map;
    Map<T, String> ?reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => MapEntry(v, k));
        }
        return reverseMap;
    }
}
